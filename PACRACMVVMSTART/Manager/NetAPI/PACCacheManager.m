//
//  PACCacheManager.m
//  PACRACMVVMSTART
//
//  Created by Mr. Chen on 2018/4/18.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import "PACCacheManager.h"
#import <YYKit/YYCache.h>
#import <YYKit/YYMemoryCache.h>
#import <YYKit/YYDiskCache.h>
#import <YYKit/YYKVStorage.h>
#import <CommonCrypto/CommonCrypto.h>

@interface PACCacheManager ()

@property (nonatomic , strong) YYCache *cache;

@end

@implementation PACCacheManager
static inline NSString *_KDNSStringMD5(NSString *string) {
    if (!string) return nil;
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(data.bytes, (CC_LONG)data.length, result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0],  result[1],  result[2],  result[3],
            result[4],  result[5],  result[6],  result[7],
            result[8],  result[9],  result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}


SYNTHESIZE_SINGLETON_FOR_CLASS(PACCacheManager)

- (instancetype)init
{
    self = [super init];
    if (self) {
        PACLog(@"cacheName:%@", NSStringFromClass([self class]));
        self.cache = [[YYCache alloc] initWithName:NSStringFromClass([self class])];
        //设置一周过期时间
        self.cache.diskCache.ageLimit = 1*7*24*60*60;
    }
    return self;
}

#pragma mark - KDCacheProtocol
- (id)getCacheForURLPath:(NSString *)path andRequestParameters:(id)parameters
{
    PACLog(@"*************读取了缓存****************");
    NSString *key = _KDNSStringMD5([NSString stringWithFormat:@"%@%@",path,[parameters description]]);
    ;
    return [self.cache objectForKey:key];
}

- (void)cacheReponse:(id)response ForURLPath:(NSString *)path andRequestParameters:(id)parameters
{
    NSString *key = _KDNSStringMD5([NSString stringWithFormat:@"%@%@",path,[parameters description]]);
    [self.cache setObject:response forKey:key];
}

- (void)cleanCacheForURLPath:(NSString *)path andRequestParameters:(id)parameters
{
    NSString *key = _KDNSStringMD5([NSString stringWithFormat:@"%@%@",path,[parameters description]]);
    [self.cache removeObjectForKey:key];
}

- (void)cleanAllCaches {
    [self.cache removeAllObjects];
}

- (void)cleanAllCachesWithBlock:(void(^)(void))block {
    [self.cache removeAllObjectsWithBlock:block];
}

- (void)cleanAllCachesWithProgressBlock:(void(^)(int removedCount, int totalCount))progress
                               endBlock:(void(^)(BOOL error))end {
    [self.cache removeAllObjectsWithProgressBlock:progress endBlock:end];
}

@end
