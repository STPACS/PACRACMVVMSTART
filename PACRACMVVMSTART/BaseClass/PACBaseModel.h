//
//  PACBaseModel.h
//  xili
//
//  Created by chenliang on 2019/3/11.
//  Copyright © 2019 Lance. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PACBaseModel : NSObject
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *image;
@property (nonatomic, copy)NSString *jumpType;
@property (nonatomic, copy)NSString *type;
@property (nonatomic, copy)NSString *detail;
@property (nonatomic, copy)NSString *content;
@property (nonatomic, copy)NSString *select;
@property (nonatomic, copy)NSString *rightContent;

-(id)initWithDataDic:(NSDictionary*)data;
- (NSDictionary*)attributeMapDictionary;
- (NSDictionary*)attributeDictionary;
- (void)setAttributes:(NSDictionary*)dataDic;
- (NSString *)customDescription;
- (NSString *)description;
- (NSData*)getArchivedData;

- (NSString *)cleanString:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
