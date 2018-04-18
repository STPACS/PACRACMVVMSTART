//
//  PACNetAPIManager.m
//  PACRACMVVMSTART
//
//  Created by Mr. Chen on 2018/4/17.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import "PACNetAPIManager.h"
#import "PACNetAPIClientManager.h"
#import "PACAPIList.h"

@implementation PACNetAPIManager
- (instancetype)init {
    self = [super init];
    if (self) {
        [PACNetAPIClientManager sharedJsonClient];
    }
    return self;
}

- (RACSignal *)request_PAClistPage:(NSUInteger )page {
    NSMutableDictionary *params = @{@"page":@(page)}.mutableCopy;
    return [[PACNetAPIClientManager sharedJsonClient] requestJsonDataWithTokenPath:Api_List_do withParams:params withMethodType:Post cache:YES];
}
@end
