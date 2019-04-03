//
//  LCRegisterFooterView.h
//  PACRACMVVMSTART
//
//  Created by chenliang on 2019/4/3.
//  Copyright © 2019 STPACS. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LCRegisterFooterViewDelegate <NSObject>

- (void)clickDoctorRegisterIsDoctor;
- (void)clickUserArgement;

@end

NS_ASSUME_NONNULL_BEGIN

@interface LCRegisterFooterView : UIView
@property (nonatomic , assign) id<LCRegisterFooterViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
