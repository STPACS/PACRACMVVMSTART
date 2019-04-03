//
//  LCLoginViewCellTableViewCell.h
//  PACRACMVVMSTART
//
//  Created by chenliang on 2019/4/3.
//  Copyright © 2019 STPACS. All rights reserved.
//

#import "PACBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@protocol LCLoginViewCellDelegate <NSObject>
//获取验证码
- (void)clickGetCode;
@end

@interface LCLoginViewCellTableViewCell : PACBaseTableViewCell
@property (nonatomic , assign)id<LCLoginViewCellDelegate>delegate;

-(void)startTime;
@end

NS_ASSUME_NONNULL_END
