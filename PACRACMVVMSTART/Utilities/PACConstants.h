//
//  PACConstants.h
//  PACRACMVVMSTART
//
//  Created by Mr. Chen on 2018/4/17.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//驾驶证号
extern NSString *const Driver_licence_number;

//档案编号
extern NSString *const file_number;

//省份（城市）
extern NSString *const province_city;
























typedef void (^VoidBlock)(void);
typedef BOOL (^BoolBlock)(void);
typedef int  (^IntBlock) (void);
typedef id   (^IDBlock)  (void);

typedef void (^VoidBlock_int)(int);
typedef BOOL (^BoolBlock_int)(int);
typedef int  (^IntBlock_int) (int);
typedef id   (^IDBlock_int)  (int);

typedef void (^VoidBlock_string)(NSString *);
typedef BOOL (^BoolBlock_string)(NSString *);
typedef int  (^IntBlock_string) (NSString *);
typedef id   (^IDBlock_string)  (NSString *);

typedef void (^VoidBlock_id)(id);
typedef BOOL (^BoolBlock_id)(id);
typedef int  (^IntBlock_id) (id);
typedef id   (^IDBlock_id)  (id);

@interface PACConstants : NSObject

extern NSString *const CODE;

extern NSString *const APIKEY;


extern NSString *const kefu;

extern NSString *const STATUS_Succ;

extern NSString *const STATUS_Fail;

extern NSString *const STATUS_ErrorCode;

extern NSString *const STATUS_Result;

extern NSString *const CON_MEMO;

extern NSString *const CON_ERROR;

extern NSString *const CON_MESSAGE;

extern NSString *const CON_MSG;

/// navigationItem 偏移
extern const CGFloat NAV_ITEM_RIGHT_OFFSET;
extern const CGFloat NAV_ITEM_LEFT_OFFSET;
extern const CGFloat NAV_ITEM_FONT_SIZE;

extern NSString *const KEY_TITLE;

//改变tabbar select的通知
extern NSString *const changeTabbarSelectNotification;

extern BOOL IS_First_Start;//标记第一次启动，用在根据定位获取天气
extern BOOL IS_First_RunLoop;//标记第一次轮询获取值
//标志是否第一次启动显示更新
extern BOOL IS_First_ShowUpdateVersion;
@end
