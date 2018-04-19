//
//  PACBaseTableViewModel.h
//  PACRACMVVMSTART
//
//  Created by STPACS on 2018/4/19.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import "PACBaseViewModel.h"

@interface PACBaseTableViewModel : PACBaseViewModel
/// 加 下拉刷新
@property (nonatomic , assign) BOOL shouldPullToRefresh;
/// 加 上拉加载
@property (nonatomic , assign) BOOL shouldInfiniteScrolling;


@property (nonatomic , strong) RACCommand *didSelectCommand;
@property (nonatomic , strong , readonly) RACCommand *requestRemoteDataCommand;
@property (nonatomic , strong , readonly) RACCommand *cancelRequestCommand;

- (BOOL (^)(NSError *error))requestRemoteDataErrorsFilter;

- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page;

@property (nonatomic, copy) void (^noMoreDataBlock)(BOOL isNoMore);

@property (nonatomic , assign) NSUInteger page;

@property (nonatomic , copy) NSArray *dataSource;

@end
