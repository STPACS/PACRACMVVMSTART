//
//  LCLoginFooterView.m
//  PACRACMVVMSTART
//
//  Created by chenliang on 2019/4/3.
//  Copyright © 2019 STPACS. All rights reserved.
//

#import "LCLoginFooterView.h"

@implementation LCLoginFooterView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    }
    return self;
}
- (void)setupViews
{
    self.backgroundColor = [UIColor whiteColor];
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_loginBtn];
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(49);
        make.height.mas_equalTo(45);
    }];
    _loginBtn.backgroundColor = [PACColorSet getColorMain];
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    _loginBtn.layer.cornerRadius = 8;
    _loginBtn.layer.masksToBounds = YES;
    @weakify(self)
    [_loginBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        [self.delegate clickLoginBtn];
    }];
    
    
    
    self.registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_registerBtn];
    [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(18);
        make.top.mas_equalTo(self.loginBtn.mas_bottom).mas_offset(25);
    }];
    [_registerBtn setTitle:@"注册账号" forState:UIControlStateNormal];
    [_registerBtn setTitleColor:[PACColorSet getColorMain] forState:UIControlStateNormal];
    _registerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_registerBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        [self.delegate clickRegisterBtn];
    }];
    
    
    
    self.forgetPasswordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_forgetPasswordBtn];
    [_forgetPasswordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-23);
        make.top.mas_equalTo(self.loginBtn.mas_bottom).mas_offset(25);
    }];
    [_forgetPasswordBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [_forgetPasswordBtn setTitleColor:[PACColorSet getColorMain] forState:UIControlStateNormal];
    _forgetPasswordBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_forgetPasswordBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        [self.delegate clickForgetPasswordBtn];
    }];
    
    
    self.thirdTitleLb = [UILabel new];
    [self addSubview:_thirdTitleLb];
    [_thirdTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(self.loginBtn.mas_bottom).mas_offset(100);
    }];
    _thirdTitleLb.font = [UIFont systemFontOfSize:14];
    _thirdTitleLb.textColor = [PACColorSet getColorMain];
    _thirdTitleLb.text = @"第三方账号登录";
    
    
    
    //    self.QQBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [self addSubview:_QQBtn];
    //    [_QQBtn mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.mas_equalTo((SCREEN_WIDTH-67-50*2)/2.0);
    //        make.top.mas_equalTo(self.thirdTitleLb.mas_bottom).mas_offset(33);
    //        make.width.height.mas_equalTo(50);
    //    }];
    //    [_QQBtn setImage:[UIImage imageNamed:@"qq"] forState:UIControlStateNormal];
    //    [_QQBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
    //        @strongify(self)
    //        [self.delegate clickQQBtn];
    //    }];
    
    
    self.weiXinBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_weiXinBtn];
    [_weiXinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(self.thirdTitleLb.mas_bottom).mas_offset(33);
        make.width.height.mas_equalTo(50);
    }];
    [_weiXinBtn setImage:[UIImage imageNamed:@"wx"] forState:UIControlStateNormal];
    [_weiXinBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        [self.delegate clickWeiXinBtn];
    }];
    
    
    //    self.WBBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [self addSubview:_WBBtn];
    //    [_WBBtn mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.mas_equalTo(self.weiXinBtn.mas_right).mas_offset(67);
    //        make.top.mas_equalTo(self.thirdTitleLb.mas_bottom).mas_offset(33);
    //        make.width.height.mas_equalTo(50);
    //    }];
    //    [_WBBtn setImage:[UIImage imageNamed:@"wb"] forState:UIControlStateNormal];
    //    [_WBBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
    //        @strongify(self)
    //        [self.delegate clickWBBtn];
    //    }];
}

@end
