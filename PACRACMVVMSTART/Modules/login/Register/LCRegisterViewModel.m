//
//  LCRegisterViewModel.m
//  PACRACMVVMSTART
//
//  Created by chenliang on 2019/4/3.
//  Copyright © 2019 STPACS. All rights reserved.
//

#import "LCRegisterViewModel.h"
#import "LCLoginCellViewModel.h"
#import "LCAregmentViewModel.h"

@implementation LCRegisterViewModel
- (void)initialize
{
    [super initialize];
    
    @weakify(self)
    self.didClickUserAregmentCmd = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self)
        LCAregmentViewModel *vm = [[LCAregmentViewModel alloc]initWithServices:self.services params:@{KEY_TITLE:@"用户协议"}];
        vm.url = @"http://www.baidu.com";
        [self.services pushViewModel:vm animated:YES];
        return [RACSignal empty];
        
    }];
    
    self.didClickrRegistCmd = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(NSNumber *isDoctor) {
        @strongify(self)
        LCLoginCellViewModel *cvm1 = self.dataSource[0][0];
        if (!cvm1.contentText || cvm1.contentText.length < 1) {
            [NSObject showHudTipStr:@"请输入手机号码"];
            return [RACSignal empty];
        }else{
            if (![RegexUtil checkTelNumber:cvm1.contentText]) {
                [NSObject showHudTipStr:@"请输入正确的手机号码"];
                return [RACSignal empty];
            }
        }
        
        LCLoginCellViewModel *cvm2 = self.dataSource[1][0];
        if (!cvm2.contentText || cvm2.contentText.length < 1) {
            [NSObject showHudTipStr:@"请输入手机验证码"];
            return [RACSignal empty];
        }
        
        
        LCLoginCellViewModel *cvm3 = self.dataSource[2][0];
        
        if (!cvm3.contentText || cvm3.contentText.length < 1) {
            [NSObject showHudTipStr:@"请填写密码"];
            return [RACSignal empty];
        }
        
        
//        return [[[self.services net_userApi]request_Api_api_Users_verify_code_doSessionId:self.sessionId?self.sessionId:@"" code:cvm2.contentText]map:^RACStream *(RACTuple *value) {
//            if ([value.first[@"code"] isEqualToString:@"200"]) {
//                MBLDataAuthenticationViewModel *vm = [[MBLDataAuthenticationViewModel alloc]initWithServices:self.services params:@{KEY_TITLE:@""}];
//                vm.selectPhoto = self.selectPhoto;
//                vm.USER_CELLPHONE = cvm1.contentText;
//                vm.USER_PASSWORD = cvm3.contentText;
//                vm.vm = self.vm;
//                [self.services pushViewModel:vm animated:YES];
//            }else{
//                if ([value.first[@"message"] isEqualToString:@"(null)"] || !value.first[@"message"] ||[value.first[@"message"] isEqualToString:@"缺少SessionId"]) {
//                    [NSObject showHudTipStr:@"验证码输入错误"];
//                }
//            }
//            return value.first;
//        }];
        return [RACSignal empty];

    }];
    
    
    self.didClickGetCodeBtnCmd = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self)
        
        LCLoginCellViewModel *cvm1 = self.dataSource[0][0];
        
        if (!cvm1.contentText || cvm1.contentText.length < 1) {
            [NSObject showHudTipStr:@"请输入手机号码"];
            return [RACSignal empty];
        }else{
            if (![RegexUtil checkTelNumber:cvm1.contentText]) {
                [NSObject showHudTipStr:@"请输入正确的手机号"];
                return [RACSignal empty];
            }else{
//                return [[[self.services net_userApi]request_Api_api_Users_send_code_doUSER_CELLPHONE:cvm1.contentText]map:^id(RACTuple *value1) {
//                    if ([value1.first[@"code"] isEqualToString:@"200"]) {
//                        self.sessionId = value1.first[@"data"][@"SessionId"];
//                        NSString *message = [NSString stringWithFormat:@"%@",value1.first[@"message"]];
//                        [NSObject showHudTipStr:message];
//                        //通过验证，倒计时
//
//                        [[NSNotificationCenter defaultCenter] postNotificationName:@"VerifyPhoneEmetyNotification" object:nil];
//
//                    }
//                    return value1;
//                }];
            }
        }
        return [RACSignal empty];

    }];

}


- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page
{
    LCLoginCellViewModel *cvm1 = [[LCLoginCellViewModel alloc]init];
    cvm1.placeHolderStr = @"手机号";
    cvm1.leftIconImageStr = @"sj";
    cvm1.keyboardType = UIKeyboardTypePhonePad;
    
    LCLoginCellViewModel *cvm2 = [[LCLoginCellViewModel alloc]init];
    cvm2.placeHolderStr = @"输入验证码";
    cvm2.leftIconImageStr = @"yzm";
    cvm2.getCodeIsHiden = YES;
    cvm2.keyboardType = UIKeyboardTypeNumberPad;
    
    LCLoginCellViewModel *cvm3 = [[LCLoginCellViewModel alloc]init];
    cvm3.placeHolderStr = @"请填写密码";
    cvm3.leftIconImageStr = @"mm";
    cvm3.secureTextEntry = YES;
    self.dataSource = @[@[cvm1],@[cvm2],@[cvm3]];

    return [RACSignal empty];
}


@end
