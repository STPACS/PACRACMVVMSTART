//
//  PACNavigationControllerStack.m
//  PACRACMVVMSTART
//
//  Created by Mr. Chen on 2018/4/18.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import "PACNavigationControllerStack.h"
#import "PACVMServicesImpl.h"
#import "RTRootNavigationController.h"
#import "PACRouter.h"
#import "PACRootViewController.h"

@interface PACNavigationControllerStack ()

@property (nonatomic , strong) id<PACVMServicesProtocol> services;


@end

@implementation PACNavigationControllerStack

- (instancetype)initWithServices:(id<PACVMServicesProtocol>)services
{
    self = [super init];
    if (self) {
        self.services = services;
        self.navigationControllers = [[NSMutableArray alloc] init];
        [self registerNavigationHooks];
    }
    return self;
}

- (void)pushNavigationController:(UINavigationController *)navigationController
{
    if ([self.navigationControllers containsObject:navigationController]) return;
    [self.navigationControllers addObject:navigationController];
}

- (UINavigationController *)popNavigationController
{
    UINavigationController *navigationController = self.navigationControllers.lastObject;
    [self.navigationControllers removeLastObject];
    return navigationController;
}

- (UINavigationController *)topNavigationController
{
    return self.navigationControllers.lastObject;
}

- (void)registerNavigationHooks
{
    @weakify(self)
    [[(NSObject *)self.services
      rac_signalForSelector:@selector(pushViewModel:animated:)]
     subscribeNext:^(RACTuple *tuple) {
         @strongify(self)
         
         /** |self.navigationControllers.lastObject = RTRootNavigationController
          |_ [self.navigationControllers.lastObject topViewController] = RTContainerController
          |_ [RTContainerController contentViewController] = BaseViewController *topViewController
          */
         //RTContainerController *containerController = (RTContainerController *)[self.navigationControllers.lastObject topViewController];
         //BaseViewController *topViewController = [containerController contentViewController];
         
         UIViewController *viewController = (UIViewController *)[[PACRouter sharedPACRouter] viewControllerForViewModel:tuple.first];
         [self.navigationControllers.lastObject pushViewController:viewController animated:[tuple.second boolValue]];
     }];
    
    [[(NSObject *)self.services
      rac_signalForSelector:@selector(popViewModelAnimated:)]
     subscribeNext:^(RACTuple *tuple) {
         @strongify(self)
         [self.navigationControllers.lastObject popViewControllerAnimated:[tuple.first boolValue]];
     }];
    
    [[(NSObject *)self.services rac_signalForSelector:@selector(popToBeforeViewModelWithNum:animated:complete:)]
     subscribeNext:^(RACTuple *tuple) {
         @strongify(self)
         RTRootNavigationController *navigationController = self.navigationControllers.lastObject;
         NSInteger index = navigationController.rt_viewControllers.count - [tuple.first integerValue] - 1;
         UIViewController *viewController = navigationController.rt_viewControllers[index];
         [navigationController popToViewController:viewController animated:[tuple.second boolValue] complete:tuple.third];
     }];
    
    [[(NSObject *)self.services
      rac_signalForSelector:@selector(popToRootViewModelAnimated:)]
     subscribeNext:^(RACTuple *tuple) {
         @strongify(self)
         [self.navigationControllers.lastObject popToRootViewControllerAnimated:[tuple.first boolValue]];
     }];
    
    [[(NSObject *)self.services
      rac_signalForSelector:@selector(presentViewModel:animated:completion:)]
     subscribeNext:^(RACTuple *tuple) {
         @strongify(self);
         UIViewController *viewController = (UIViewController *)[[PACRouter sharedPACRouter] viewControllerForViewModel:tuple.first];
         UINavigationController *presentingViewController = self.navigationControllers.lastObject;
         if (![viewController isKindOfClass:UINavigationController.class]) {
             viewController = [[RTRootNavigationController alloc] initWithRootViewController:viewController];
         }
         [self pushNavigationController:(UINavigationController *)viewController];
         [presentingViewController presentViewController:viewController animated:[tuple.second boolValue] completion:tuple.third];
     }];
    
    [[(NSObject *)self.services
      rac_signalForSelector:@selector(dismissViewModelAnimated:completion:)]
     subscribeNext:^(RACTuple *tuple) {
         @strongify(self)
         [self.navigationControllers.lastObject dismissViewControllerAnimated:[tuple.first boolValue] completion:tuple.second];
         [self popNavigationController];
     }];
    
    [[(NSObject *)self.services
      rac_signalForSelector:@selector(resetRootViewModel:)]
     subscribeNext:^(RACTuple *tuple) {
         @strongify(self);
         [self.navigationControllers removeAllObjects];
         
         UIViewController *viewController = (UIViewController *)[[PACRouter sharedPACRouter] viewControllerForViewModel:tuple.first];
         if (![viewController isKindOfClass:[UINavigationController class]] &&
             ![viewController isKindOfClass:[PACRootViewController class]]) {
             viewController = [[RTRootNavigationController alloc] initWithRootViewController:viewController];
             [self pushNavigationController:(UINavigationController *)viewController];
         }
         
         
         kSharedAppDelegate.window.rootViewController = viewController;

         CATransition *fade = [CATransition animation];
         fade.type = kCATransitionFade;
         fade.duration = 0.25;
         [kSharedAppDelegate.window.layer addAnimation:fade forKey:nil];

     }];
}


- (void)dealloc
{
    PACLog(@"导航管理已销毁");
}
@end
