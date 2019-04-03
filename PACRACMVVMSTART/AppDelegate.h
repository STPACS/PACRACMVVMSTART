//
//  AppDelegate.h
//  PACRACMVVMSTART
//
//  Created by Mr. Chen on 2018/4/16.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PACNavigationControllerStack.h"
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic , strong , readonly) PACNavigationControllerStack *navigationControllerStack;
@property (nonatomic , strong) RACCommand *test;
- (void)resetRootViewController;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@end

