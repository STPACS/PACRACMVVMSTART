//
//  LoginUserDefaultMessage.h
//  OnHealth
//
//  Created by Mr. Chen on 2018/1/20.
//  Copyright © 2018年 petle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginUserDefaultMessage : NSObject

//保存登录信息
+(void)saveLoginMessage:(NSDictionary *)dic;

//保存输入
+(void)saveInputMessage:(NSDictionary *)dic key:(NSString *)key;
//获取保存的信息
+ (NSDictionary *)returnALLInputMessageForKey:(NSString *)key;



//保存手机号
+(void)savePhoneMessage:(NSString *)phone;
//删除手机号
+(void)deletedPhoneMessage;
//检查手机号
+ (BOOL)checkPhone;
//返回手机号
+ (NSString *)returnPhoneMessage;

//删除userdefault
+(void)deleteUserDefaultMessage:(NSString *)key;

//传入key 登录信息
+ (NSString *)returnKeyToValueMessage:(NSString *)key;

// 登录信息
+ (NSDictionary *)returnALLToValueMessage;

//检查是否登录
+ (BOOL)checkLogin;

+(void)logout;

+ (BOOL)firstLogin;

//通知类消息
+ (NSString *)returnKeyToValueNotifacation:(NSString *)key name:(NSString *)name;

+ (BOOL)checkhave:(NSString *)name;

@end
