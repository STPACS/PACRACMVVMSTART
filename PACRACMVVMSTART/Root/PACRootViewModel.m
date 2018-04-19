//
//  PACRootViewModel.m
//  PACRACMVVMSTART
//
//  Created by STPACS on 2018/4/19.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import "PACRootViewModel.h"

@interface PACRootViewModel ()
/// 首页
@property (nonatomic , strong , readwrite) PACHomeViewModel            *homeViewModel;
/// 二
@property (nonatomic , strong , readwrite) PACSecondViewModel       *secondViewModel;
/// 三
@property (nonatomic , strong , readwrite) PACThirdViewModel         *thirdViewModel;
/// 四
@property (nonatomic , strong , readwrite) PACFourthViewModel            *fourthViewModel;
/// 五
@property (nonatomic , strong , readwrite) PACFivthViewModel            *fivthViewModel;

@end

@implementation PACRootViewModel

- (void)initialize {
    [super initialize];
    
    self.homeViewModel            = [[PACHomeViewModel alloc] initWithServices:self.services params:@{KEY_TITLE:@"首页"}];
    self.secondViewModel       = [[PACSecondViewModel alloc] initWithServices:self.services params:@{KEY_TITLE:@"二"}];
    self.thirdViewModel = [[PACThirdViewModel alloc] initWithServices:self.services params:@{KEY_TITLE:@"三"}];
    self.fourthViewModel            = [[PACFourthViewModel alloc] initWithServices:self.services params:@{KEY_TITLE:@"四"}];
    self.fivthViewModel            = [[PACFivthViewModel alloc] initWithServices:self.services params:@{KEY_TITLE:@"五"}];
    

    
}
@end
