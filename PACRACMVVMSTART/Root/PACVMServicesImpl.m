//
//  PACVMServicesImpl.m
//  PACRACMVVMSTART
//
//  Created by Mr. Chen on 2018/4/18.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import "PACVMServicesImpl.h"

@implementation PACVMServicesImpl
@synthesize net_userApi = _net_userApi;

- (instancetype)init
{
    self = [super init];
    if (self) {
        _net_userApi = [[PACNetAPIManager alloc] init];
    }
    return self;
}

- (void)pushViewModel:(PACBaseViewModel *)viewModel animated:(BOOL)animated {}

- (void)popViewModelAnimated:(BOOL)animated {}

- (void)popToBeforeViewModelWithNum:(NSInteger)num animated:(BOOL)animated complete:(void(^)(BOOL finished))block {}

- (void)popToRootViewModelAnimated:(BOOL)animated {}

- (void)presentViewModel:(PACBaseViewModel *)viewModel animated:(BOOL)animated completion:(VoidBlock)completion {}

- (void)dismissViewModelAnimated:(BOOL)animated completion:(VoidBlock)completion {}

- (void)resetRootViewModel:(PACBaseViewModel *)viewModel {}


- (void)dealloc
{
    PACLog(@"服务已销毁");
}

@end
