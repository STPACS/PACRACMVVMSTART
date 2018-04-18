//
//  PACCacheProtocol.h
//  PACRACMVVMSTART
//
//  Created by Mr. Chen on 2018/4/18.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PACCacheProtocol <NSObject>

@required

- (id)getCacheForURLPath:(NSString *)path andRequestParameters:(id)parameters;

- (void)cacheReponse:(id)response ForURLPath:(NSString *)path andRequestParameters:(id)parameters;

- (void)cleanCacheForURLPath:(NSString *)path andRequestParameters:(id)parameters;

@optional

- (void)cleanAllCaches;

- (void)cleanAllCachesWithBlock:(void(^)(void))block;

- (void)cleanAllCachesWithProgressBlock:(void(^)(int removedCount, int totalCount))progress
                               endBlock:(void(^)(BOOL error))end;

@end
