//
//  PACCacheManager.h
//  PACRACMVVMSTART
//
//  Created by Mr. Chen on 2018/4/18.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PACCacheProtocol.h"
#import "PACSynthesizeSinglet.h"
#import "PACCacheManager.h"

@interface PACCacheManager : NSObject<PACCacheProtocol>
SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(PACCacheManager)

@end
