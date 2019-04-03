//
//  LCRegisterViewModel.h
//  PACRACMVVMSTART
//
//  Created by chenliang on 2019/4/3.
//  Copyright © 2019 STPACS. All rights reserved.
//

#import "PACBaseTableViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LCRegisterViewModel : PACBaseTableViewModel
@property (nonatomic , strong) RACCommand *didClickUserAregmentCmd;//用户协议
@property (nonatomic , strong) RACCommand *didClickrRegistCmd;//注册
@property (nonatomic , copy) void (^verifyPhoneEmety) (void);
@property (nonatomic , strong) RACCommand *didClickGetCodeBtnCmd;//获取验证码
@end

NS_ASSUME_NONNULL_END
