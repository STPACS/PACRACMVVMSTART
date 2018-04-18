//
//  PACNetAPIManager.h
//  PACRACMVVMSTART
//
//  Created by Mr. Chen on 2018/4/17.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PACNetAPIManager : NSObject
//示例
- (RACSignal *)request_PAClistPage:(NSUInteger )page;

@end
