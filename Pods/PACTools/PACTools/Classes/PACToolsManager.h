//
//  PACToolsManager.h
//  PACTools
//
//  Created by Mr. Chen on 2018/4/11.
//  Copyright © 2018年 Mr. Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PACToolsManager : NSObject

//------------------userDefault---------------
//保存登录信息
+(void)saveLoginMessage:(NSDictionary *)dic;

//传入key 登录信息
+ (NSString *)returnKeyToValueMessage:(NSString *)key;

//检查是否登录
+ (BOOL)checkLogin;

//退出登录
+(void)logout;

//保存userdefault
+(void)saveDefaultKey:(NSString *)key value:(id)value ;

//删除userdefault
+(void)deleteUserDefaultMessage:(NSString *)key;

//截屏
+(void)currectImage:(UIView *)view;

@end
