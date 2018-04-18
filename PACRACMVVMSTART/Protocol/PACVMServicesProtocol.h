//
//  PACVMServicesProtocol.h
//  PACRACMVVMSTART
//
//  Created by Mr. Chen on 2018/4/17.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PACNavGationProtocol.h"
#import "PACNetAPIManager.h"

@protocol PACVMServicesProtocol <NSObject,PACNavGationProtocol>

@required
@property (nonatomic , strong , readonly) PACNetAPIManager *net_userApi;

@end
