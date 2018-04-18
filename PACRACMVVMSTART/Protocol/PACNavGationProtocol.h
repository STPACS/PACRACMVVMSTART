//
//  PACNavGationProtocol.h
//  PACRACMVVMSTART
//
//  Created by Mr. Chen on 2018/4/18.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PACBaseViewModel.h"

@protocol PACNavGationProtocol <NSObject>
- (void)pushViewModel:(PACBaseViewModel *)viewModel animated:(BOOL)animated;

- (void)popViewModelAnimated:(BOOL)animated;

/**
 *  pop到倒数第几view controller
 */
- (void)popToBeforeViewModelWithNum:(NSInteger)num animated:(BOOL)animated complete:(void(^)(BOOL finished))block;;

- (void)popToRootViewModelAnimated:(BOOL)animated;

- (void)presentViewModel:(PACBaseViewModel *)viewModel animated:(BOOL)animated completion:(VoidBlock)completion;

- (void)dismissViewModelAnimated:(BOOL)animated completion:(VoidBlock)completion;

/// Reset the corresponding view controller as the root view controller of the application's window.
///
/// viewModel - the view model
- (void)resetRootViewModel:(PACBaseViewModel *)viewModel;
@end
