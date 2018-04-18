//
//  PACBaseViewController.h
//  PACRACMVVMSTART
//
//  Created by Mr. Chen on 2018/4/18.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PACBaseViewModel.h"

@interface PACBaseViewController : UIViewController

@property (nonatomic , strong , readonly) PACBaseViewModel *viewModel;

- (instancetype)initWithViewModel:(PACBaseViewModel *)viewModel;

- (void)bindViewModel;

@end
