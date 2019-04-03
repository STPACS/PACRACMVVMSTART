//
//  LCForgetPasswordViewModel.m
//  PACRACMVVMSTART
//
//  Created by chenliang on 2019/4/3.
//  Copyright © 2019 STPACS. All rights reserved.
//

#import "LCForgetPasswordViewModel.h"
#import "LCLoginCellViewModel.h"

@implementation LCForgetPasswordViewModel
- (void)initialize
{
    [super initialize];
    self.shouldNavBackItem = YES;
    
    LCLoginCellViewModel *cvm1 = [[LCLoginCellViewModel alloc]init];
    cvm1.placeHolderStr = @"请输入手机号";
    cvm1.leftIconImageStr = @"sj";
    cvm1.keyboardType = UIKeyboardTypePhonePad;
    
    
    LCLoginCellViewModel *cvm2 = [[LCLoginCellViewModel alloc]init];
    cvm2.placeHolderStr = @"输入验证码";
    cvm2.leftIconImageStr = @"yzm";
    cvm2.getCodeIsHiden = YES;
    
    
    LCLoginCellViewModel *cvm3 = [[LCLoginCellViewModel alloc]init];
    cvm3.placeHolderStr = @"请输入密码";
    cvm3.leftIconImageStr = @"mm";
    cvm3.secureTextEntry = YES;
    
    
    LCLoginCellViewModel *cvm4 = [[LCLoginCellViewModel alloc]init];
    cvm4.placeHolderStr = @"请再次输入密码";
    cvm4.leftIconImageStr = @"mm";
    cvm4.secureTextEntry = YES;
    self.dataSource = @[@[cvm1],@[cvm2],@[cvm3],@[cvm4]];
    
    
    @weakify(self)
    self.didClickGetCodeBtnCmd = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self)
        //        先验证手机号是否注册（已注册）-----获取验证码
        LCLoginCellViewModel *cvm1 = self.dataSource[0][0];
        if (!cvm1.contentText || cvm1.contentText.length < 1) {
            [NSObject showHudTipStr:cvm1.placeHolderStr];
            return [RACSignal empty];
        }else{
            if (![RegexUtil checkTelNumber:cvm1.contentText]) {
                [NSObject showHudTipStr:@"请输入正确的手机号"];
                return [RACSignal empty];
            }else{
                return [RACSignal empty];

//                return [[[self.services net_userApi]request_Api_api_Users_selectUserReister_doUSER_CELLPHONE:cvm1.contentText]flattenMap:^RACStream *(RACTuple *value) {
//                    if ([value.first[@"code"] isEqualToString:@"200"]) {
//                        [NSObject showHudTipStr:@"手机号未注册"];
//                        return [RACSignal empty];
//                    }else{
//                        [NSObject showHudTipStr:@"验证码已发送"];
//                        //已注册获取验证码
//                        return [[[self.services net_userApi]request_Api_api_Users_send_code_doUSER_CELLPHONE:cvm1.contentText]map:^id(RACTuple *valueSecond) {
//
//                            [[NSNotificationCenter defaultCenter] postNotificationName:@"VerifyPhoneEmetyNotification" object:nil];
//
//                            return valueSecond.first;
//                        }];
//                    }
//                }];
            }
        }
        
        
    }];
    
    
    
    self.didClickResetBtnCmd = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self)
        LCLoginCellViewModel *cvm1 = self.dataSource[0][0];
        if (!cvm1.contentText || cvm1.contentText.length < 1) {
            [NSObject showHudTipStr:cvm1.placeHolderStr];
            return [RACSignal empty];
        }
        
        LCLoginCellViewModel *cvm2 = self.dataSource[1][0];
        if (!cvm2.contentText || cvm2.contentText.length < 1) {
            [NSObject showHudTipStr:cvm2.placeHolderStr];
            return [RACSignal empty];
        }
        
        LCLoginCellViewModel *cvm3 = self.dataSource[2][0];
        if (!cvm3.contentText || cvm3.contentText.length < 1) {
            [NSObject showHudTipStr:cvm3.placeHolderStr];
            return [RACSignal empty];
        }
        
        LCLoginCellViewModel *cvm4 = self.dataSource[3][0];
        if (!cvm4.contentText || cvm4.contentText.length < 1) {
            [NSObject showHudTipStr:cvm4.placeHolderStr];
            return [RACSignal empty];
        }
        return [RACSignal empty];

//        return [[[self.services net_userApi]request_Api_api_Users_updatePassword_doUSER_CELLPHONE:cvm1.contentText  USER_PASSWORD:cvm3.contentText]map:^id(RACTuple *value) {
//            if ([value.first[@"code"] isEqualToString:@"200"]) {
//                [self.services popViewModelAnimated:YES];
//            }
//            return value;
//        }];
    }];
}
@end
