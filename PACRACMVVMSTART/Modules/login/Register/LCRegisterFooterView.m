//
//  LCRegisterFooterView.m
//  PACRACMVVMSTART
//
//  Created by chenliang on 2019/4/3.
//  Copyright © 2019 STPACS. All rights reserved.
//

#import "LCRegisterFooterView.h"

@interface LCRegisterFooterView ()
@property (nonatomic , strong) UIButton *registerBtn;
@property (nonatomic , strong) UIButton *chooseBtn;
@property (nonatomic , strong) UIButton *theRegistrationAgreementBtn;
@end

@implementation LCRegisterFooterView

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
    self.registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_registerBtn];
    [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(49);
        make.height.mas_equalTo(45);
    }];
    _registerBtn.backgroundColor = [PACColorSet getColorMain];
    _registerBtn.layer.cornerRadius = 8;
    _registerBtn.layer.masksToBounds = YES;
    
    @weakify(self)
    [_registerBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(UIButton *sender) {
        @strongify(self)
        
//        if ([self.delegate respondsToSelector:@selector(clickDoctorRegisterIsDoctor)]) {
//            [self.delegate clickDoctorRegister];
//        }
    }];
    
    self.chooseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_chooseBtn];
    [_chooseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(5);
        make.top.mas_equalTo(self.registerBtn.mas_bottom).mas_offset(28);
    }];
    [_chooseBtn setImage:[UIImage imageNamed:@"wxz"] forState:UIControlStateNormal];
    [_chooseBtn setImage:[UIImage imageNamed:@"wxz_selected"] forState:UIControlStateSelected];
    [_chooseBtn setTitle:@"我已阅读并同意" forState:UIControlStateNormal];
    _chooseBtn.selected = YES;
    [_chooseBtn setTitleColor:[PACColorSet getColorMain] forState:UIControlStateNormal];
    [_chooseBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(UIButton *sender) {
        sender.selected = !sender.selected;
    }];
    _chooseBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    _chooseBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -15);
    _chooseBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -25);
    
    
    
    self.theRegistrationAgreementBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_theRegistrationAgreementBtn];
    [_theRegistrationAgreementBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.chooseBtn.mas_right).mas_offset(5);
        make.centerY.mas_equalTo(self.chooseBtn.mas_centerY);
    }];
    [_theRegistrationAgreementBtn setTitle:@"《用户注册协议》" forState:UIControlStateNormal];
    [_theRegistrationAgreementBtn setTitleColor:[PACColorSet getColorMain] forState:UIControlStateNormal];
    _theRegistrationAgreementBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [_theRegistrationAgreementBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(UIButton *sender) {
        @strongify(self)
        if ([self.delegate respondsToSelector:@selector(clickUserArgement)]) {
            [self.delegate clickUserArgement];
        }
    }];
}


@end
