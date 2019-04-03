//
//  LCLoginViewModel.m
//  PACRACMVVMSTART
//
//  Created by chenliang on 2019/4/3.
//  Copyright © 2019 STPACS. All rights reserved.
//

#import "LCLoginViewModel.h"
#import "LCLoginCellViewModel.h"
#import "LCRegisterViewModel.h"
#import "LCForgetPasswordViewModel.h"


@implementation LCLoginViewModel
- (void)initialize
{
    [super initialize];
    self.shouldNavBackItem = YES;
  
    @weakify(self)
    self.didClickLoginBtnCmd = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self)
        LCLoginCellViewModel *cvm1 = self.dataSource[0][0];
        if (!cvm1.contentText || cvm1.contentText.length < 1) {
            [NSObject showHudTipStr:@"请输入手机号"];
            return [RACSignal empty];
        }else{
            if (![RegexUtil checkTelNumber:cvm1.contentText]) {
                [NSObject showHudTipStr:@"请输入正确的手机号"];
                return [RACSignal empty];
            }
        }
        
        LCLoginCellViewModel *cvm2 = self.dataSource[1][0];
        if (!cvm2.contentText || cvm2.contentText.length < 1) {
            [NSObject showHudTipStr:@"请输入密码"];
            return [RACSignal empty];
        }
        return [RACSignal empty];
//        return [[[self.services net_userApi]request_Api_api_Users_LoginPassword_doUSER_CELLPHONE:cvm1.contentText USER_PASSWORD:cvm2.contentText]map:^id(RACTuple *value) {
//            if ([value.first[@"code"] isEqualToString:@"200"]) {
//
//                NSString *userId = [NSString stringWithFormat:@"%@",value.first[@"data"][@"USER_ID"]];
//
//                [JPUSHService setAlias:[NSString stringWithFormat:@"%@",userId] completion:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
//
//                } seq:[userId intValue]];
//
//                [LoginUserDefaultMessage saveLoginMessage:value.first[@"data"]];
//
//
//
//                [self.services dismissViewModelAnimated:YES completion:nil];
//            }
//            return value;
//        }];
    }];
    
    
    self.didClickRegisterBtnCmd = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self)
        LCRegisterViewModel *vm = [[LCRegisterViewModel alloc]initWithServices:self.services params:@{KEY_TITLE:@""}];
//        vm.delegate = self;
        [self.services pushViewModel:vm animated:YES];
        return [RACSignal empty];
    }];
    
    
    self.didClickForgetPasswordBtnCmd = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self)
        LCForgetPasswordViewModel *vm = [[LCForgetPasswordViewModel alloc]initWithServices:self.services params:@{KEY_TITLE:@""}];
        [self.services pushViewModel:vm animated:YES];
        return [RACSignal empty];
    }];
    
    self.didClickQQBtnCmd = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {

        return [RACSignal empty];
    }];
    
//    self.didClickWeiXinBtn = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(UMSocialUserInfoResponse * resp) {
//        @strongify(self)
//        //首先调登录接口
//
//        NSString *unionid = [resp.originalResponse objectForKey:@"unionid"];
//
//        return [[[self.services net_userApi]request_Api_wap_login_SF_Login_doUSER_SFID:unionid]map:^id(RACTuple *value) {
//            if ([value.first[@"code"] isEqualToString:@"200"]) {
//
//                //如果成功，直接登录，否则，去注册
//

//                NSString *userId = [NSString stringWithFormat:@"%@",value.first[@"data"][@"USER_ID"]];
//
//                [JPUSHService setAlias:[NSString stringWithFormat:@"%@",userId] completion:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
//
//                } seq:[userId intValue]];
//
//                [LoginUserDefaultMessage saveLoginMessage:value.first[@"data"]];
//
//                [self.services dismissViewModelAnimated:YES completion:nil];
//            } else {
//
//                MBLRegisterTypeViewModel *vm = [[MBLRegisterTypeViewModel alloc]initWithServices:self.services params:@{KEY_TITLE:@""}];
//                vm.delegate = self;
//                vm.isThird = YES;
//                vm.respIconurl = resp.iconurl;
//                vm.respName = resp.name;
//                vm.respOpenid = resp.uid;
//                vm.WX_UNIONID = [resp.originalResponse objectForKey:@"unionid"];
//                [self.services pushViewModel:vm animated:YES];
//
//            }
//            return value;
//        }];
//    }];

}

- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page {
    
    LCLoginCellViewModel *cvm1 = [[LCLoginCellViewModel alloc]init];
    cvm1.placeHolderStr = @"手机号";
    cvm1.keyboardType = UIKeyboardTypeNumberPad;
    cvm1.secureTextEntry = NO;
    
    LCLoginCellViewModel *cvm2 = [[LCLoginCellViewModel alloc]init];
    cvm2.placeHolderStr = @"输入密码";
    cvm2.secureTextEntry = YES;
    
    self.dataSource = @[@[cvm1],@[cvm2]];

    
    return [RACSignal empty];
}


@end
