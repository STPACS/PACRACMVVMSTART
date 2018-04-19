//
//  PACConstants.h
//  PACRACMVVMSTART
//
//  Created by Mr. Chen on 2018/4/17.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

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



@end
