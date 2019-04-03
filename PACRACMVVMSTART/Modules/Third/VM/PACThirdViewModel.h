//
//  PACThirdViewModel.h
//  PACRACMVVMSTART
//
//  Created by STPACS on 2018/4/19.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import "PACBaseTableViewModel.h"

@interface PACThirdViewModel : PACBaseTableViewModel
@property (nonatomic , strong) RACCommand *presentLoginControllerCmd;//登录
@property (nonatomic , copy) void (^reloadTable) (void);
@end
