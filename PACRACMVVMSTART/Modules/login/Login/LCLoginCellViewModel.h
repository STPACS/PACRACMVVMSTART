//
//  LCLoginCellViewModel.h
//  PACRACMVVMSTART
//
//  Created by chenliang on 2019/4/3.
//  Copyright © 2019 STPACS. All rights reserved.
//

#import "PACBaseCellViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LCLoginCellViewModel : PACBaseCellViewModel
@property (nonatomic , strong) NSString *contentText;
@property (nonatomic , strong) NSString *leftIconImageStr;
@property (nonatomic , strong) NSString *placeHolderStr;
@property (nonatomic , assign) UIKeyboardType keyboardType;
@property (nonatomic , assign) BOOL secureTextEntry;
@property (nonatomic , assign) BOOL getCodeIsHiden;
@end

NS_ASSUME_NONNULL_END
