//
//  HomeViewController.m
//  AES-256Demo
//
//  Created by DayDream on 2020/1/30.
//  Copyright © 2020 Apple.Inc. All rights reserved.
//

#import "HomeViewController.h"
#import "DetailViewController.h"
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation HomeViewController
-(NSArray *)titles
{
    return @[@"AES_CBC_Encrypt",@"AES_CBC_Decrypt",@"AES_ECB_Encrypt",@"AES_ECB_Decrypt"];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Encrypt/Decrypt";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
    // Do any additional setup after loading the view.
}


#pragma UITableViewDelegate && Datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self titles].count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = [[self titles] objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *VC = [DetailViewController new];
    VC.title = [[self titles] objectAtIndex:indexPath.row];
    VC.style = indexPath.row;
    [self.navigationController pushViewController:VC animated:YES];
}
@end
