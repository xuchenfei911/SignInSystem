//
//  AppDelegate.m
//  signIn
//
//  Created by xuchenfei on 2021/4/2.
//

#import "AppDelegate.h"
#import "bottonTabBarControllerViewController.h"
#import "newsTableViewController.h"
#import "toolCabinetViewController.h"
#import "personInfoViewController.h"
#import "messageTableViewController.h"
#import "mainViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    
    bottonTabBarControllerViewController *tabBarController = [[bottonTabBarControllerViewController alloc]init];
    
 
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}


#pragma mark - Core Data stack


@end
