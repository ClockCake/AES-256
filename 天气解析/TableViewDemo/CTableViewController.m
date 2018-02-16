//
//  CTableViewController.m
//  TableViewDemo
//
//  Created by 黄尧栋 on 11/02/2018.
//  Copyright © 2018 Apple.Inc. All rights reserved.
//

#import "CTableViewController.h"

@interface CTableViewController ()

@end

@implementation CTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _arrayToday = [_dicToday allKeys];
   
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arrayToday.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"today"];
    if (cell ==nil) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"today"];
    }
    
   
    for (int i=0; i<_arrayToday.count; i++) {
        if ([[_dicToday objectForKey:[_arrayToday objectAtIndex:indexPath.row]] isKindOfClass:[NSString class]]) {
            cell.detailTextLabel.text =[_dicToday objectForKey:[_arrayToday objectAtIndex:indexPath.row]];
            cell.textLabel.text =[_arrayToday objectAtIndex:indexPath.row];
        }
        else if ([[_dicToday objectForKey:[_arrayToday objectAtIndex:indexPath.row]] isKindOfClass:[NSDictionary class]])
        {
            cell.textLabel.text =[_arrayToday objectAtIndex:indexPath.row];
            cell.detailTextLabel.text =@"nil";
          
        }
    }
    
    return cell;
}

/*-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[_dicToday objectForKey:[_arrayToday objectAtIndex:indexPath.row]] isKindOfClass:[NSDictionary class]]) {
        DTableViewController *DTC =[[DTableViewController alloc]init];
        DTC.dicID =[_dicToday objectForKey:@"weather_id"];
        [self.navigationController pushViewController:DTC animated:YES];
        
    }
}*/
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

@end
