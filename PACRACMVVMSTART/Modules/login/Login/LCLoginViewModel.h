//
//  LCLoginViewModel.h
//  PACRACMVVMSTART
//
//  Created by chenliang on 2019/4/3.
//  Copyright © 2019 STPACS. All rights reserved.
//

#import "PACBaseTableViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LCLoginViewModel : PACBaseTableViewModel
@property (nonatomic , strong) RACCommand *didClickLoginBtnCmd;//登录
@property (nonatomic , strong) RACCommand *didClickRegisterBtnCmd;//注册
@property (nonatomic , strong) RACCommand *didClickForgetPasswordBtnCmd;//忘记密码
@property (nonatomic , strong) RACCommand *didClickQQBtnCmd;//QQ登录
@property (nonatomic , strong) RACCommand *didClickWeiXinBtn;//微信登录
@property (nonatomic , copy) void (^reloadTableView) (void);

@end

NS_ASSUME_NONNULL_END
