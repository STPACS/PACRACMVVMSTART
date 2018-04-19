//
//  PACRouter.h
//  PACRACMVVMSTART
//
//  Created by Mr. Chen on 2018/4/18.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PACBaseViewController.h"
#import "PACSynthesizeSinglet.h"

@interface PACRouter : NSObject

SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(PACRouter)

@property (nonatomic , strong , readonly) NSSet *rootViewControllers;

- (PACBaseViewController *)viewControllerForViewModel:(PACBaseViewModel *)viewModel;

@end
