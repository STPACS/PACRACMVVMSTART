//
//  PACRootViewController.h
//  PACRACMVVMSTART
//
//  Created by STPACS on 2018/4/18.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import "PACBaseViewController.h"
#import "PACRDVTabBarController.h"

@interface PACRootViewController : PACBaseViewController<UITabBarControllerDelegate>

@property (nonatomic , strong ) UITabBarController *tabBarController;

@end
