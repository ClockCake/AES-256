//
//  DecryptTableViewController.m
//  AES-256Demo
//
//  Created by 黄尧栋 on 24/02/2018.
//  Copyright © 2018 Apple.Inc. All rights reserved.
//

#import "DecryptTableViewController.h"
#import "NSString+AES_CBC.h"
@interface DecryptTableViewController ()

@end

@implementation DecryptTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.TextField.delegate = self;
    
    _Key = @"ucf-Gx4-dsn-oyH";
    _IV =@"BdA-&@D-mNC";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

/*- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}
*/
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)DecryptAction:(id)sender {
    _Context = [[LAContext new]init];
    _Context.localizedReason =@"通过Home键验证已有指纹";
    _Context.localizedCancelTitle =@"取消";
    _Context.localizedFallbackTitle =@"输入密码";
    NSError *error;
    if ([_Context canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:&error]) {
        [_Context evaluatePolicy:LAPolicyDeviceOwnerAuthentication localizedReason:_Context.localizedReason reply:^(BOOL success, NSError * _Nullable error) {
            if (success) {
                dispatch_async(dispatch_get_main_queue(),^{
                    _TextField.text =[_TextField.text AES256DecryptWithKey:_Key iv:_IV];
                    _Label.text =[_TextField.text stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                    
                });
            }
            else{
                switch (error.code) {
                    case LAErrorUserFallback:
                    {switch (error.code) {
                        case LAErrorUserFallback:
                        {
                            NSLog(@"使用者请求输入手动输入密码");
                            break;
                            
                        }
                        case LAErrorAppCancel:
                        {
                            NSLog(@"应用中断");
                            break;
                        }
                        case LAErrorPasscodeNotSet:
                        {
                            NSLog(@"密码未设置");
                            break;
                        }
                        case LAErrorSystemCancel:
                        {
                            NSLog(@"TouchID对话框被系统取消，例如按下Home或者电源键");
                            break;
                        }
                            
                        default:
                            break;
                    }
                        NSLog(@"使用者请求输入手动输入密码");
                        break;
                        
                    }
                    case LAErrorAppCancel:
                    {
                        NSLog(@"应用中断");
                        break;
                    }
                    case LAErrorPasscodeNotSet:
                    {
                        NSLog(@"密码未设置");
                        break;
                    }
                    case LAErrorSystemCancel:
                    {
                        NSLog(@"TouchID对话框被系统取消，例如按下Home或者电源键");
                        break;
                    }
                        
                    default:
                        break;
                }
            }
        }];
    }
  
    
}
@end
