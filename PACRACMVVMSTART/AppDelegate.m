//
//  AppDelegate.m
//  PACRACMVVMSTART
//
//  Created by Mr. Chen on 2018/4/16.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import "AppDelegate.h"
#import "PACVMServicesImpl.h"
#import "PACNavigationControllerStack.h"
#import "PACRootViewModel.h"

@interface AppDelegate ()
@property (nonatomic , strong , readwrite) PACVMServicesImpl *services;
@property (nonatomic , strong , readwrite) PACNavigationControllerStack *navigationControllerStack;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self resetRootViewController];

    [self.window makeKeyAndVisible];

    return YES;
}

- (PACBaseViewModel *)createInitViewModel {
    return [[PACRootViewModel alloc]initWithServices:self.services params:nil];
}

- (void)resetRootViewController {
    self.services = [[PACVMServicesImpl alloc] init];
    self.navigationControllerStack = [[PACNavigationControllerStack alloc] initWithServices:self.services];
    
    [self.services resetRootViewModel:[self createInitViewModel]];
    
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
