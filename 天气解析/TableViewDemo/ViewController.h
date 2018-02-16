//
//  ViewController.h
//  TableViewDemo
//
//  Created by 黄尧栋 on 07/02/2018.
//  Copyright © 2018 Apple.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
@interface ViewController : UIViewController

- (IBAction)Analysis:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *TextField;
@property (strong,nonatomic)NSMutableString *city;
@property (strong,nonatomic)NSMutableDictionary *RootDic;
@end

