//
//  PACBaseCellViewModel.h
//  PACRACMVVMSTART
//
//  Created by chenliang on 2018/10/17.
//  Copyright © 2018 STPACS. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface PACBaseCellViewModel : NSObject
///总高度
@property (nonatomic , assign) CGFloat height;
@property (nonatomic , copy) NSString *type_string;//控制cell类型

@end

NS_ASSUME_NONNULL_END
