//
//  LCLoginFooterView.h
//  PACRACMVVMSTART
//
//  Created by chenliang on 2019/4/3.
//  Copyright © 2019 STPACS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@protocol LCLoginFooterViewDelegate <NSObject>

- (void)clickLoginBtn;
- (void)clickRegisterBtn;
- (void)clickForgetPasswordBtn;


- (void)clickQQBtn;
- (void)clickWeiXinBtn;
- (void)clickWBBtn;

@end

@interface LCLoginFooterView : UIView
@property (nonatomic , assign) id<LCLoginFooterViewDelegate>delegate;
@property (nonatomic , strong) UIButton *loginBtn;
@property (nonatomic , strong) UIButton *registerBtn;
@property (nonatomic , strong) UIButton *forgetPasswordBtn;
@property (nonatomic , strong) UILabel *thirdTitleLb;
@property (nonatomic , strong) UIButton *QQBtn;
@property (nonatomic , strong) UIButton *weiXinBtn;
@property (nonatomic , strong) UIButton *WBBtn;
@end

NS_ASSUME_NONNULL_END
