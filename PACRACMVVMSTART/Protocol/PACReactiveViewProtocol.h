//
//  PACReactiveViewProtocol.h
//  PACRACMVVMSTART
//
//  Created by chenliang on 2019/4/3.
//  Copyright © 2019 STPACS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PACReactiveViewProtocol <NSObject>
- (void)setupViews;

- (void)bindViewModel:(id)viewModel;
@end

NS_ASSUME_NONNULL_END
