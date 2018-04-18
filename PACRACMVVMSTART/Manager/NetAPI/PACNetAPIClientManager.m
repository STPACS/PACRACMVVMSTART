//
//  PACNetAPIClientManager.m
//  PACRACMVVMSTART
//
//  Created by Mr. Chen on 2018/4/17.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import "PACNetAPIClientManager.h"
#import "PACCacheManager.h"

#define kNetworkMethodName @[@"Get", @"Post", @"Put", @"Delete"]

static NSTimeInterval kAppNetTimeoutInterval = 30;

static NSString *const PARAM_Data  = @"data";
static NSString *const PARAM_Token = @"token";

@implementation PACNetAPIClientManager

static PACNetAPIClientManager *shareClient = nil;
static dispatch_once_t onceToken;

+ (instancetype)sharedJsonClient {
    dispatch_once(&onceToken, ^{
        shareClient = [[PACNetAPIClientManager alloc] initWithBaseURL:[NSURL URLWithString:PACAPPBaseUrl]];
        
        /// 必须在 主线程 获取
        UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectZero];
        NSString *userAgent = [webView stringByEvaluatingJavaScriptFromString:
                               @"navigator.userAgent"];
        
        [shareClient.requestSerializer setValue:userAgent forHTTPHeaderField:@"User-Agent"];
    });
    return shareClient;
}

+ (instancetype)changeJsonClient {
    shareClient = [[PACNetAPIClientManager alloc] initWithBaseURL:[NSURL URLWithString:PACAPPBaseUrl]];
    return shareClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    self.requestSerializer.timeoutInterval = kAppNetTimeoutInterval;
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
    [self.requestSerializer setValue:@"application/json"  forHTTPHeaderField:@"Content－Type"];
    return self;
}

#pragma mark RACSupport 支持
- (RACSignal *)rac_requestPath:(NSString *)path parameters:(id)parameters method:(NSString *)method {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSError *serializationError = nil;
        NSURLRequest *request = [self.requestSerializer requestWithMethod:method URLString:[NSString stringWithFormat:@"%@%@",self.baseURL,path] parameters:parameters error:&serializationError];
#ifdef DEBUG
        if (serializationError) {
            PACLog(@"======Request serializationError======\n%@\n",serializationError);
        }
#endif
        NSURLSessionDataTask *task = [self dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
            
            if (error) {
                PACLog(@"\n===========failure===========\nApi:%@:\nError:%@\n", path, error);
                NSMutableDictionary *userInfo = [error.userInfo mutableCopy];
                if (responseObject) {
                    userInfo[RACAFNResponseObjectErrorKey] = responseObject;
                }
                NSError *errorWithRes = [NSError errorWithDomain:error.domain code:error.code userInfo:[userInfo copy]];
                [subscriber sendError:errorWithRes];
                PACLog(@"\n===========NSError===========%@",  error.localizedDescription);

            }else{
                [subscriber sendNext:RACTuplePack(responseObject, response)];
                [subscriber sendCompleted];
            }
        }];
        [task resume]; //开始请求
        
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
}

- (RACSignal *)rac_GET:(NSString *)path parameters:(id)parameters {
    return [[self rac_requestPath:path parameters:parameters method:@"GET"]
            setNameWithFormat:@"%@ -rac_GET: %@, parameters: %@", self.class, path, parameters];
}

- (RACSignal *)rac_POST:(NSString *)path parameters:(id)parameters {
    return [[self rac_requestPath:path parameters:parameters method:@"POST"]
            setNameWithFormat:@"%@ -rac_POST: %@, parameters: %@", self.class, path, parameters];
}

#pragma mark - NetError
- (NSError *)handleResponse:(id)responseJSON autoShowError:(BOOL)autoShowError {
    NSError *error = nil;
    //code为非0值时，表示有错
    NSInteger errorCode = [(NSNumber *)[responseJSON valueForKeyPath:CODE] integerValue];
    
//    NSString *errorMessage = [NSString stringWithFormat:@"%@",[responseJSON valueForKeyPath:CON_MESSAGE]];
    
    if (errorCode != 200) {
       
        error = [NSError errorWithDomain:PACAPPBaseUrl code:errorCode userInfo:@{NSLocalizedDescriptionKey:responseJSON[CON_MESSAGE]?responseJSON[CON_MESSAGE]:@"数据格式错误"}];
    }
    return error;
}


#pragma mark - NetSuccess
- (RACTuple *)handleResponse:(id)responseJSON error:(NSError *)error path:(NSString *)path parameters:(NSDictionary *)parameters cache:(BOOL)cache {
    PACLog(@"\n===========response===========\nApi:%@:\nParams:%@\nResponse:%@", path, parameters, [(NSDictionary *)responseJSON jsonPrettyStringEncoded]);
    
    NSString *responseJsoncode = [NSString stringWithFormat:@"%@",responseJSON[CODE]];
    
    if (!error && [responseJsoncode isEqualToString:@"200"])
    {
        if (cache) {
            [[PACCacheManager sharedPACCacheManager] cacheReponse:responseJSON ForURLPath:path andRequestParameters:parameters];
        }
        
        if ([responseJSON isKindOfClass:[NSDictionary class]]) {
            return RACTuplePack(responseJSON, nil);
        }
        return RACTuplePack(responseJSON, nil);
    }
    else
    {
        id response = nil;
        if (cache) response = [[PACCacheManager sharedPACCacheManager] getCacheForURLPath:path andRequestParameters:parameters];
        return RACTuplePack(response, error);
    }
}

- (RACSignal *)requestJsonDataWithTokenPath:(NSString *)aPath
                                 withParams:(NSMutableDictionary *)params
                             withMethodType:(NetworkMethod)method
                                      cache:(BOOL)cache {
    if (!params) params = @{}.mutableCopy;
    NSString *token = [[NSUserDefaults standardUserDefaults]objectForKey:@"token"]?[[NSUserDefaults standardUserDefaults]objectForKey:@"token"]:@"0";
    NSString *hString = [token?token:@"" stringByURLEncode];
    
    if (![aPath isEqualToString:@"api/Users/updatePassword.do"]) {
        if ([aPath isEqualToString:@"api/Users/selectUser.do"] || [aPath isEqualToString:@"api/Users/updateNickName.do"] || [aPath isEqualToString:@"api/Users/updateUserSex.do"] || [aPath isEqualToString:@"api/Users/updateUserCellPhone.do"] || [aPath isEqualToString:@"api/Users/updateUserJieShao.do"] || [aPath isEqualToString:@"api/Users/updateUserYiYuan.do"] || [aPath isEqualToString:@"api/Users/updateUserZhiCheng.do"] || [aPath isEqualToString:@"api/Users/updateUserShanChang.do"] || [aPath isEqualToString:@"api/verify/addVerify.do"]) {
            
            
            if (token.length > 1) {
                [params setValue:hString forKey:@"TOKEN"];
            }
        }else{
            if (token.length > 1) {
                [params setValue:hString forKey:PARAM_Token];
            }
        }
    }
    
    return [self requestJsonDataWithPath:aPath withParams:params paramsEncode:NO withMethodType:method cache:cache autoShowError:YES];
}

- (RACSignal *)requestJsonDataWithPath:(NSString *)aPath
                            withParams:(NSDictionary*)params
                          paramsEncode:(BOOL)encode
                        withMethodType:(NetworkMethod)method
                                 cache:(BOOL)cache
                         autoShowError:(BOOL)autoShowError {
    if (!aPath || aPath.length <= 0) {
        return [RACSignal empty];
    }
    
    NSString *urlStr = aPath;
    PACLog(@"\n===========request===========\nMethod:%@\nApi:%@:\nParams:%@", kNetworkMethodName[method], urlStr, params);
    
    switch (method) {
        case Get: {
            return [[[[self rac_GET:urlStr parameters:params]
                      map:^id(RACTuple *value) {
                          NSError *error = [self handleResponse:value.first autoShowError:autoShowError];
                          return [self handleResponse:value.first error:error path:aPath parameters:params cache:cache];
                      }]
                     catch:^RACSignal *(NSError *error) {
                         PACLog(@"\n===========failure===========\nApi:%@:\nError:%@\n", aPath, error);
                         id response = nil;
                         if (cache) response = [[PACCacheManager sharedPACCacheManager] getCacheForURLPath:aPath andRequestParameters:params];
                         return [RACSignal return:RACTuplePack(response, error)];
                     }] replayLazily];
        }
            
        case Post: {
            return [[[[self rac_POST:urlStr parameters:params]
                      map:^id(RACTuple *value) {
                          NSError *error = [self handleResponse:value.first autoShowError:autoShowError];
                          return [self handleResponse:value.first error:error path:aPath parameters:params cache:cache];
                          
                      }]
                     catch:^RACSignal *(NSError *error) {
                         PACLog(@"\n===========failure===========\nApi:%@:\nError:%@\n", aPath, error);
                         id response = nil;
                         if (cache) response = [[PACCacheManager sharedPACCacheManager] getCacheForURLPath:aPath andRequestParameters:params];
                         return [RACSignal return:RACTuplePack(response, error)];
                     }] replayLazily];
        }
        default:
            return [RACSignal empty];
    }
}

#pragma mark - upload
- (RACSignal *)uploadImages:(NSString *)aPath
                 withParams:(NSDictionary *)params
                     images:(NSArray<UIImage *> *)images
                  filenames:(NSArray<NSString *> *)filenames
                       name:(NSString *)name
                   mimeType:(NSString *)mimeType
                   progress:(void (^)(NSProgress *))progress {
    if (!aPath || aPath.length <= 0) {
        return [RACSignal empty];
    }
    
    
    NSDictionary *signParames = nil;
    NSString *urlStr = aPath;
    
    if (signParames) {
        //含有参数
        NSMutableString *paraTempString = [NSMutableString string];
        //拼接数据
        [signParames enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            [paraTempString appendFormat:@"%@=%@&",key,obj];
        }];
        //去除最后一个字符
        NSString *paramsStr = [paraTempString substringToIndex:paraTempString.length-1];
        NSRange range = [aPath rangeOfString:@"?"];
        BOOL paramsAlreadyAppend = range.length > 0;
        NSString *symbol = paramsAlreadyAppend ? @"&" : @"?";
        urlStr = [NSString stringWithFormat:@"%@%@%@",urlStr,symbol,paramsStr];
    }
    
    if (mimeType == nil || ![mimeType isKindOfClass:[NSString class]] || mimeType.length == 0) {
        mimeType = @"image/jpeg";
    }
    
    void (^constructingBodyBlock)(id <AFMultipartFormData> formData) = ^(id <AFMultipartFormData> formData) {
        NSData *imageData = nil;
        NSString *imageFileName = nil;
        
        
        for (int i = 0; i < images.count; i++) {
            imageData = UIImageJPEGRepresentation(images[i], 0.5);
            
            if (i < filenames.count) {
                imageFileName = filenames[i];
            }
            
            if (imageFileName == nil || ![imageFileName isKindOfClass:[NSString class]] || imageFileName.length == 0) {
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                formatter.dateFormat = @"yyyyMMddHHmmss";
                NSString *str = [formatter stringFromDate:[NSDate date]];
                imageFileName = [NSString stringWithFormat:@"%@_%d.jpg", str, i];
            }
            // 上传图片，以文件流的格式  为多张上传时name后面加[] , 例如@"files[]"
            [formData appendPartWithFileData:imageData name:name fileName:imageFileName mimeType:mimeType];
        }
    };
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSError *serializationError = nil;
        NSMutableURLRequest *request = [self.requestSerializer multipartFormRequestWithMethod:@"POST" URLString:[[NSURL URLWithString:urlStr relativeToURL:self.baseURL] absoluteString] parameters:params constructingBodyWithBlock:constructingBodyBlock error:&serializationError];
#ifdef DEBUG
        if (serializationError) {
            PACLog(@"======Request serializationError======\n%@\n",serializationError);
        }
#endif
        NSURLSessionDataTask *task = [self uploadTaskWithStreamedRequest:request progress:progress completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
            if (error) {
                NSMutableDictionary *userInfo = [error.userInfo mutableCopy];
                if (responseObject) {
                    userInfo[RACAFNResponseObjectErrorKey] = responseObject;
                }
                NSError *errorWithRes = [NSError errorWithDomain:error.domain code:error.code userInfo:[userInfo copy]];
                [subscriber sendError:errorWithRes];
            }else{
                PACLog(@"\n======uploadImage responseObject========\njson:%@", [(NSDictionary *)responseObject jsonPrettyStringEncoded]);// 打印格式化后的JSON
                
                NSError *err = [NSError errorWithDomain:@"" code:[responseObject[CODE] integerValue] userInfo:@{NSLocalizedDescriptionKey:responseObject[CON_MESSAGE]}];
                if ([responseObject[@"code"] isEqualToString:@"500"]) {
                    [subscriber sendNext:RACTuplePack(nil, err)];
                    [subscriber sendCompleted];
                    PACLog(@"%@",responseObject[@"message"]);// 打印格式化后的JSON
                }else{
                    [subscriber sendNext:RACTuplePack(responseObject, err)];
                    [subscriber sendCompleted];
                }
            }
        }];
        
        [task resume];
        
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
}

@end
