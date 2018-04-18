//
//  PACBaseViewModel.m
//  PACRACMVVMSTART
//
//  Created by STPACS on 2018/4/16.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import "PACBaseViewModel.h"

@interface PACBaseViewModel ()
@property (nonatomic , strong , readwrite) id<PACVMServicesProtocol> services;
@property (nonatomic , copy , readwrite) NSDictionary *params;
@property (nonatomic , strong , readwrite) RACSubject *errors;
@property (nonatomic , strong , readwrite) RACSubject *willDisappearSignal;
@end

@implementation PACBaseViewModel

+(instancetype) allocWithZone:(struct _NSZone *)zone {
    PACBaseViewModel *viewModel = [super allocWithZone:zone];
    @weakify(viewModel)
    [[viewModel rac_signalForSelector:@selector(initWithServices:params:)] subscribeNext:^(id x) {
        @strongify(viewModel)
        [viewModel initialize];
    }];
    return viewModel;
}

- (instancetype)initWithServices:(id<PACVMServicesProtocol>)services params:(NSDictionary *)params {
    self = [super init];
    if (self) {
        self.shouldFetchLocalDataOnViewModelInitialize = YES;
        self.shouldRequestRemoteDataOnViewDidLoad      = YES;
        self.title                                     = params[@"title"];
        self.services                                  = services;
        self.params                                    = params;
    }
    return self;
}

- (RACSubject *)errors {
    if (!_errors) _errors = [RACSubject subject];
    return _errors;
}

- (RACSubject *)willDisappearSignal
{
    if (!_willDisappearSignal) _willDisappearSignal = [RACSubject subject];
    return _willDisappearSignal;
}

- (void)initialize
{
    
}
@end
