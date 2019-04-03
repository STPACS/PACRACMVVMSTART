//
//  PACRouter.m
//  PACRACMVVMSTART
//
//  Created by Mr. Chen on 2018/4/18.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import "PACRouter.h"

@interface PACRouter ()
@property (nonatomic , strong , readwrite) NSSet *rootViewControllers;
@property (nonatomic , copy) NSDictionary *viewModelViewMappings; // viewModel到vc的映射
@end

@implementation PACRouter
SYNTHESIZE_SINGLETON_FOR_CLASS(PACRouter)

- (PACBaseViewController *)viewControllerForViewModel:(PACBaseViewModel *)viewModel
{
    NSString *viewController = self.viewModelViewMappings[NSStringFromClass(viewModel.class)];
    
    NSParameterAssert([NSClassFromString(viewController) isSubclassOfClass:[PACBaseViewController class]]);
    NSParameterAssert([NSClassFromString(viewController) instancesRespondToSelector:@selector(initWithViewModel:)]);
    
    return [[NSClassFromString(viewController) alloc] initWithViewModel:viewModel];
}

- (NSDictionary *)viewModelViewMappings {
    if(_viewModelViewMappings == nil) {
        _viewModelViewMappings = @{
                                   @"PACRootViewModel" : @"PACRootViewController",
                                   @"PACFivthViewModel":@"PACFivthViewController",
                                   @"LCLoginViewModel":@"LCLoginViewController",
                                   @"LCRegisterViewModel":@"LCRegisterViewController",
                                   @"LCForgetPasswordViewModel":@"LCForgetPasswordViewController",
                                   @"LCAregmentViewModel":@"LCAregmentViewController"
                                   };
    }
    return _viewModelViewMappings;
}


- (NSSet *)rootViewControllers {
    if(_rootViewControllers == nil) {
        _rootViewControllers = [NSSet setWithObjects:@"PACHomeViewController",
                                @"PACSecondViewController",
                                @"PACThirdViewController",
                                @"PACFourthViewController",nil];
    }
    return _rootViewControllers;
}

@end
