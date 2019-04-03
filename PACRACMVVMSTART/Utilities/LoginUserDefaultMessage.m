//
//  LoginUserDefaultMessage.m
//  OnHealth
//
//  Created by Mr. Chen on 2018/1/20.
//  Copyright © 2018年 petle. All rights reserved.
//

#import "LoginUserDefaultMessage.h"

static NSString *const loginMessage   = @"loginMessage";
static NSString *const userid   = @"userid";
static NSString *const phoness   = @"phone";

@implementation LoginUserDefaultMessage

//保存的登录信息

+(void)saveLoginMessage:(NSDictionary *)dic {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:dic forKey:loginMessage];
    [userDefault synchronize];
}

//保存输入
+(void)saveInputMessage:(NSDictionary *)dic key:(NSString *)key{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:dic forKey:key];
    [userDefault synchronize];
}
//获取保存的信息
+ (NSDictionary *)returnALLInputMessageForKey:(NSString *)key{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [userDefaults objectForKey:key];
    return dic;
}


//保存手机号
+(void)savePhoneMessage:(NSString *)phone {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:phone forKey:phoness];
    [userDefault synchronize];
}

//删除手机号
+(void)deletedPhoneMessage{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:phoness];
    [userDefaults synchronize];
}

//检查手机号
+ (BOOL)checkPhone{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [userDefaults objectForKey:phoness];
    if (dic == nil) {
        return NO;
    }
    else
        return  YES;
}

//返回手机号
+ (NSString *)returnPhoneMessage{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *valueMessage = [NSString stringWithFormat:@"%@",[userDefaults objectForKey:phoness]?[userDefaults objectForKey:phoness]:@""];
    return valueMessage;
}


+ (NSString *)returnKeyToValueMessage:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [userDefaults objectForKey:loginMessage];
    NSString *valueMessage = [NSString stringWithFormat:@"%@",[dic objectForKey:key]?[dic objectForKey:key]:@""];
    NSLog(@"个人信息：%@",dic);
    return valueMessage;
}

// 登录信息
+ (NSDictionary *)returnALLToValueMessage{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [userDefaults objectForKey:loginMessage];
    return dic;
}

+ (BOOL)firstLogin {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [userDefaults objectForKey:@"firstMessage"];
    if (dic == nil) {
        return NO;
    }
    else
        return  YES;
}

//检查是否登录
+ (BOOL)checkLogin {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [userDefaults objectForKey:loginMessage];
    if (dic == nil) {
        return NO;
    }
    else
        return  YES;
}

//删除userdefault
+(void)deleteUserDefaultMessage:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:key];
    [userDefaults synchronize];
}

+(void)logout {
    NSString *userId = [NSString stringWithFormat:@"%@",[LoginUserDefaultMessage returnKeyToValueMessage:userid]];
    
    NSMutableSet * tags = [[NSMutableSet alloc] init];
    [tags addObject:[NSString stringWithFormat:@"%@",userId]];

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:loginMessage];
    [userDefaults synchronize];
}

+ (NSString *)returnKeyToValueNotifacation:(NSString *)key name:(NSString *)name {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [userDefaults objectForKey:name];
    NSString *valueMessage = [dic objectForKey:key];
    return valueMessage;
}

+ (BOOL)checkhave:(NSString *)name {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [userDefaults objectForKey:name];
    if (dic == nil) {
        return NO;
    }
    else
        return  YES;
}
@end
