//
//  PACToolsManager.m
//  PACTools
//
//  Created by Mr. Chen on 2018/4/11.
//  Copyright © 2018年 Mr. Chen. All rights reserved.
//

#import "PACToolsManager.h"

//登录信息
static NSString *const SaveLoginMessage   = @"SaveLoginMessage";

@implementation PACToolsManager
+(void)saveLoginMessage:(NSDictionary *)dic {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:dic forKey:SaveLoginMessage];
    [userDefault synchronize];
}

+ (NSString *)returnKeyToValueMessage:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [userDefaults objectForKey:SaveLoginMessage];
    NSString *valueMessage = [NSString stringWithFormat:@"%@",[dic objectForKey:key]];
    return valueMessage;
}

//检查是否登录
+ (BOOL)checkLogin {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [userDefaults objectForKey:SaveLoginMessage];
    if (dic == nil) {
        return NO;
    }
    else
    return  YES;
}

+(void)logout {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:SaveLoginMessage];
    [userDefaults synchronize];
}

//saveDefaultMessage
+(void)saveDefaultKey:(NSString *)key value:(id)value {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:value forKey:key];
    [userDefault synchronize];
}

//删除userdefault
+(void)deleteUserDefaultMessage:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:key];
    [userDefaults synchronize];
}

//截屏
+(void)currectImage:(UIView *)view {
    UIGraphicsBeginImageContext(view.bounds.size);
    
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(image,self, nil, nil);
}
@end
