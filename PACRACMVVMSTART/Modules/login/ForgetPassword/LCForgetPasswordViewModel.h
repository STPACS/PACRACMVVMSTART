//
//  LCForgetPasswordViewModel.h
//  PACRACMVVMSTART
//
//  Created by chenliang on 2019/4/3.
//  Copyright © 2019 STPACS. All rights reserved.
//

#import "PACBaseTableViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LCForgetPasswordViewModel : PACBaseTableViewModel
@property (nonatomic , strong) RACCommand *didClickGetCodeBtnCmd;
@property (nonatomic , strong) RACCommand *didClickResetBtnCmd;
@end

NS_ASSUME_NONNULL_END
