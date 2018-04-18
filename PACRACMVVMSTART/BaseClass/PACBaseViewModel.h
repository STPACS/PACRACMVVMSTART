//
//  PACBaseViewModel.h
//  PACRACMVVMSTART
//
//  Created by STPACS on 2018/4/16.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@protocol PACVMServicesProtocol;

@interface PACBaseViewModel : NSObject

/**
 *  初始化方法,这是创建一个新的VM首选的方法
 *  services  模型层服务
 *  params  传递到VM的参数
 */
- (instancetype)initWithServices:(id <PACVMServicesProtocol>)services params:(NSDictionary *)params;

/**
 *
 *  services  模型层服务
 */
@property (nonatomic, strong, readonly)id<PACVMServicesProtocol>services;

/**
 *  title
 */
@property (nonatomic, copy) NSString *title;

/**
 *  errors  错误对象
 */
@property (nonatomic, strong, readonly) RACSubject *errors;

/**
 *
 */
@property (nonatomic, assign) BOOL shouldFetchLocalDataOnViewModelInitialize;

/**
 *
 */
@property (nonatomic , assign) BOOL shouldRequestRemoteDataOnViewDidLoad;

/**
 *  控制导航栏
 */
@property (nonatomic , assign) BOOL shouldNavBackItem;

/**
 *
 */
@property (nonatomic , strong , readonly) RACSubject *willDisappearSignal;

/**
 *
 */
- (void)initialize;


@end
