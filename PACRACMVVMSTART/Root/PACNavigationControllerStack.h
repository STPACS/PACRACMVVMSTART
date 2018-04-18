//
//  PACNavigationControllerStack.h
//  PACRACMVVMSTART
//
//  Created by Mr. Chen on 2018/4/18.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol PACVMServicesProtocol;

@interface PACNavigationControllerStack : NSObject

- (instancetype)initWithServices:(id<PACVMServicesProtocol>)services;

- (void)pushNavigationController:(UINavigationController *)navigationController;

- (UINavigationController *)popNavigationController;

- (UINavigationController *)topNavigationController;

@property (nonatomic , strong) NSMutableArray *navigationControllers;




@end
