//
//  LCloginHeaderView.m
//  PACRACMVVMSTART
//
//  Created by chenliang on 2019/4/3.
//  Copyright © 2019 STPACS. All rights reserved.
//

#import "LCloginHeaderView.h"

@implementation LCloginHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    }
    return self;
}
- (void)setupViews
{
    self.backgroundColor = [UIColor whiteColor];
    UILabel *titleLb = [[UILabel alloc]init];
    [self addSubview:titleLb];
    [titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(36);
        make.centerX.mas_equalTo(0);
    }];
    titleLb.font = [UIFont boldSystemFontOfSize:24];
    titleLb.text = @"欢迎您注册";
}
@end
