//
//  NSObject+ShowTips.m
//  PACRACMVVMSTART
//
//  Created by chenliang on 2018/11/3.
//  Copyright © 2018 STPACS. All rights reserved.
//

#import "NSObject+ShowTips.h"

@implementation NSObject (ShowTips)

+ (void)showHudTipStr:(NSString *)tipStr{
    if (tipStr && tipStr.length > 0) {
        
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kKeyWindow animated:YES];
        hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
        hud.bezelView.color = [PACColorSet getColor000000Alpha60];
        hud.contentColor = [UIColor whiteColor];
        hud.mode = MBProgressHUDModeText;
        hud.label.text = tipStr;
        
        hud.removeFromSuperViewOnHide = YES;
        [hud hideAnimated:YES afterDelay:0.9];
    }
}
    
    
+ (MBProgressHUD *)showBusyHUD {
    [MBProgressHUD hideHUDForView:kKeyWindow animated:YES];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kKeyWindow animated:YES];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = [PACColorSet getColor000000Alpha60];
    hud.contentColor = [UIColor whiteColor];
    [hud hideAnimated:YES afterDelay:60.0];
    return hud;
}
    
+ (void)hideBusyHUD:(MBProgressHUD *)HUD {
    [HUD hideAnimated:YES];
}
    
+ (void)hideBusyHUDD {
    [MBProgressHUD hideHUDForView:kKeyWindow animated:YES];
}
@end
