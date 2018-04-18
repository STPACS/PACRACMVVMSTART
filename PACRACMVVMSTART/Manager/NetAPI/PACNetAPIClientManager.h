//
//  PACNetAPIClientManager.h
//  PACRACMVVMSTART
//
//  Created by Mr. Chen on 2018/4/17.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

typedef NS_ENUM(NSUInteger, NetworkMethod) {
    Get = 0,
    Post,
    Put,
    Delete
};

//BaseUrl
static NSString *const PACAPPBaseUrl = @"";

static NSString *const RACAFNResponseObjectErrorKey = @"responseObject";

@interface PACNetAPIClientManager : AFHTTPSessionManager

@property (nonatomic , strong) NSString *userToken;

+ (instancetype)sharedJsonClient;

+ (instancetype)changeJsonClient;

/** 默认 不加密参数, 加Token, 不出登录UI, 显示错误HUD */
- (RACSignal *)requestJsonDataWithTokenPath:(NSString *)aPath
                                 withParams:(NSMutableDictionary *)params
                             withMethodType:(NetworkMethod)method
                                      cache:(BOOL)cache;

/**
 *  多张图片上传
 *
 *  @param aPath             接口地址
 *  @param params        参数
 *  @param images            图片数组
 *  @param filenames          文件名字数组 若 空 默认为当前日期时间,格式为"yyyyMMddHHmmss"，后缀为`jpg`
 *  @param name              与指定的图片相关联的名称，这是由后端写接口的人指定的，如imagefiles
 *  @param mimeType          默认为image/jpeg
 *  @param progress          上传进度
 */
- (RACSignal *)uploadImages:(NSString *)aPath
                 withParams:(NSDictionary*)params
                     images:(NSArray<UIImage *> *)images
                  filenames:(NSArray<NSString *> *)filenames
                       name:(NSString *)name
                   mimeType:(NSString *)mimeType
                   progress:(void (^)(NSProgress *))progress;
@end
