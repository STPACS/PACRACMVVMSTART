//
//  CustomBarItem.h
//  live
//
//  Created by kingdream on 16/5/2.
//  Copyright © 2016年 bigdata. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum{
    left,
    center,
    right
}ItemType;

typedef void (^ActionBlock)(id sender);

@interface UIButton(Block)

@property (readonly) NSMutableDictionary *event;

- (void)addBlockForControlEvents:(UIControlEvents)controlEvents withBlock:(ActionBlock)action;

@end



@interface CustomBarItem : NSObject

@property (nonatomic, strong) UIBarButtonItem *fixBarItem;
@property (nonatomic, strong) UIButton *contentBarItem;
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, assign) ItemType itemType;
@property (nonatomic, strong) UIView *customView;
@property (nonatomic, assign) BOOL isCustomView;

+ (CustomBarItem *)itemWithTitle:(NSString *)title textColor:(UIColor *)color fontSize:(CGFloat)font itemType:(ItemType)type;
+ (CustomBarItem *)itemWithImage:(NSString *)imageName size:(CGSize)size type:(ItemType)type;
+ (CustomBarItem *)itemWithCustomeView:(UIView *)customView type:(ItemType)type;
- (void)setItemWithNavigationItem:(UINavigationItem *)navigationItem itemType:(ItemType)type;
- (void)addTarget:(id)target selector:(SEL)selector event:(UIControlEvents)event;
- (void)addBlockForControlEvents:(UIControlEvents)controlEvents block:(ActionBlock)block;

- (void)initCustomItemWithType:(ItemType)type andSize:(CGSize)size;
- (void)setItemContetnWithType:(ItemType)type;
/**
 *设置item偏移量
 *@param offSet 正值向左偏，负值向右偏
 */
- (void)setOffset:(CGFloat)offSet;
@end






