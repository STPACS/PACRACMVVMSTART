//
//  PACChoseView.h
//  PACRACMVVMSTART
//
//  Created by STPACS on 2018/7/30.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PACNavChooseScrollViewDelegate;

@interface PACChoseView : UIView
@property(strong ,nonatomic) NSMutableArray * modelAry;
@property(strong  ,nonatomic)  UIScrollView * scrollView;
@property (nonatomic, assign) NSInteger currentBtnIndex;
-(void)selectedItem:(UIButton *)sender;
@property(strong ,nonatomic) id<PACNavChooseScrollViewDelegate> delegate;

@end

@protocol PACNavChooseScrollViewDelegate <NSObject>

-(void)pacNavChooseView:(PACChoseView *)chooseView clickItem:( id)itemModel withIndex:(NSInteger )index;


@end
