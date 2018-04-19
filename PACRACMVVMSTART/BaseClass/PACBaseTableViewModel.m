//
//  PACBaseTableViewModel.m
//  PACRACMVVMSTART
//
//  Created by STPACS on 2018/4/19.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import "PACBaseTableViewModel.h"

@interface PACBaseTableViewModel ()
@property (nonatomic , strong , readwrite) RACCommand *requestRemoteDataCommand;
@property (nonatomic , strong , readwrite) RACCommand *cancelRequestCommand;

@end


@implementation PACBaseTableViewModel
- (void)initialize
{
    [super initialize];
    
    self.page = 0;
    
    @weakify(self)
    self.requestRemoteDataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(NSNumber *page) {
        @strongify(self)
        return [[self requestRemoteDataSignalWithPage:page.unsignedIntegerValue] takeUntil:self.rac_willDeallocSignal];
    }];
    
    [[self.requestRemoteDataCommand.errors
      filter:[self requestRemoteDataErrorsFilter]]
     subscribe:self.errors];
    
    self.cancelRequestCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        PACLog(@"cancel request:%@", input);
        return [RACSignal empty];
    }];
}

- (BOOL (^)(NSError *error))requestRemoteDataErrorsFilter {
    return ^(NSError *error) {
        return YES;
    };
}

- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page
{
    // 子类重写, 网络请求
    return [RACSignal empty];
}
@end
