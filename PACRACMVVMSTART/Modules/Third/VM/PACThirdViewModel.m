//
//  PACThirdViewModel.m
//  PACRACMVVMSTART
//
//  Created by STPACS on 2018/4/19.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import "PACThirdViewModel.h"
#import "LCLoginViewModel.h"


@implementation PACThirdViewModel

- (void)initialize {
    [super initialize];
//    self.shouldNavBackItem = YES;
//    self.shouldPullToRefresh = YES;

    @weakify(self)
    
    self.presentLoginControllerCmd = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(RACTuple *params) {
        @strongify(self)
        LCLoginViewModel *vm = [[LCLoginViewModel alloc] initWithServices:self.services params:@{KEY_TITLE:@"登录"}];
        [self.services presentViewModel:vm animated:YES completion:nil];
        return [RACSignal empty];
            
    }];
    
    self.didSelectCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(NSIndexPath *indexPath) {
        @strongify(self)
       
        return [RACSignal empty];
    }];
}

- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page {
    
    NSMutableDictionary *messageDic = [NSMutableDictionary dictionary];
    
   
    return [RACSignal empty];
}


@end

