//
//  LCAregmentViewModel.h
//  PACRACMVVMSTART
//
//  Created by chenliang on 2019/4/3.
//  Copyright © 2019 STPACS. All rights reserved.
//

#import "PACBaseTableViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LCAregmentViewModel : PACBaseTableViewModel
@property (nonatomic , strong) NSString *url;
@property (nonatomic , strong) NSString *MESSAGE_ID;
@property (nonatomic , copy) void (^reloadData) (NSString *url);

@end

NS_ASSUME_NONNULL_END
