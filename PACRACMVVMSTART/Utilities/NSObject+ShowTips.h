//
//  NSObject+ShowTips.h
//  PACRACMVVMSTART
//
//  Created by chenliang on 2018/11/3.
//  Copyright © 2018 STPACS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ShowTips)
+ (void)showHudTipStr:(NSString *)tipStr;
    /** 显示忙提示 */
+ (MBProgressHUD *)showBusyHUD;
    /** 隐藏忙提示 */
+ (void)hideBusyHUD:(MBProgressHUD *)HUD;
+ (void)hideBusyHUDD;
@end

NS_ASSUME_NONNULL_END
