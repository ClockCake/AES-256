//
//  AppDelegate.m
//  AES-256Demo
//
//  Created by 黄尧栋 on 23/02/2018.
//  Copyright © 2018 Apple.Inc. All rights reserved.
//

#import "AppDelegate.h"
#import "SyncViewController.h"
#import "EncryptTableViewController.h"
#import "DecryptTableViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window =[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    UINavigationController *NAV =[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Nav"];
    UITabBarItem *item =[[UITabBarItem alloc]initWithTitle:@"Sync" image:[UIImage imageNamed:@"Sync.png"] tag:101];
    NAV.tabBarItem =item;
    SyncViewController *Sync =[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Sync"];
   
    EncryptTableViewController *Encrypt =[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Encrypt"];
    UITabBarItem *item01 =[[UITabBarItem alloc]initWithTitle:@"Encrypt" image:[UIImage imageNamed:@"Encrypt.png"] tag:102];
    Encrypt.tabBarItem =item01;
    
    DecryptTableViewController *Decrypt =[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Decrypt"];
    UITabBarItem *item02=[[UITabBarItem alloc]initWithTitle:@"Decrypt" image:[UIImage imageNamed:@"Decrypt.png"] tag:103];
    Decrypt.tabBarItem =item02;
    NSArray *arrayControllers= [NSArray arrayWithObjects:Encrypt,Decrypt,NAV,nil];
    UITabBarController *TBC =[[UITabBarController alloc]init];
    TBC.tabBar.barStyle =UIBarStyleBlack;
    TBC.viewControllers =arrayControllers;
    self.window.rootViewController =TBC;
    [self.window makeKeyAndVisible];
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
