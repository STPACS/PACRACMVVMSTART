//
//  PACRootViewModel.h
//  PACRACMVVMSTART
//
//  Created by STPACS on 2018/4/19.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import "PACBaseViewModel.h"
#import "PACHomeViewModel.h"
#import "PACSecondViewModel.h"
#import "PACThirdViewModel.h"
#import "PACFourthViewModel.h"
#import "PACFivthViewModel.h"

@interface PACRootViewModel : PACBaseViewModel
/// 首页
@property (nonatomic , strong , readonly) PACHomeViewModel            *homeViewModel;
/// 二
@property (nonatomic , strong , readonly) PACSecondViewModel       *secondViewModel;
/// 三
@property (nonatomic , strong , readonly) PACThirdViewModel         *thirdViewModel;
/// 四
@property (nonatomic , strong , readonly) PACFourthViewModel            *fourthViewModel;
/// 五
@property (nonatomic , strong , readonly) PACFivthViewModel            *fivthViewModel;

@end
