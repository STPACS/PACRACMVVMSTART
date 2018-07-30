//
//  PACRootViewController.m
//  PACRACMVVMSTART
//
//  Created by STPACS on 2018/4/18.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import "PACRootViewController.h"
#import "PACRootViewModel.h"
#import "RTRootNavigationController.h"
#import "PACHomeViewController.h"
#import "PACSecondViewController.h"
#import "PACThirdViewController.h"
#import "PACFourthViewController.h"
#import "PACFivthViewController.h"
#import "RDVTabBarItem.h"

@interface PACRootViewController ()
@property (nonatomic , strong) PACRootViewModel *viewModel;
@property (nonatomic , strong) RTRootNavigationController *communityNav;
@end

@implementation PACRootViewController
@dynamic viewModel;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.view.frame = self.view.frame;
    
    [self addChildViewController:self.tabBarController];
    [self.view addSubview:self.tabBarController.view];
    
    [self setupViewControllers];
    
    // Do any additional setup after loading the view.
}

- (void)setupViewControllers {
    
    
    RTRootNavigationController *homeNav = ({
        PACHomeViewController *vc = [[PACHomeViewController alloc] initWithViewModel:self.viewModel.homeViewModel];
        [[RTRootNavigationController alloc] initWithRootViewController:vc];
    });
    

    RTRootNavigationController *postFundraisingNav = ({
        PACThirdViewController *vc = [[PACThirdViewController alloc] initWithViewModel:self.viewModel.thirdViewModel];
        [[RTRootNavigationController alloc] initWithRootViewController:vc];
    });
    
    RTRootNavigationController *shopNav = ({
        PACFourthViewController *vc = [[PACFourthViewController alloc] initWithViewModel:self.viewModel.fourthViewModel];
        [[RTRootNavigationController alloc] initWithRootViewController:vc];
    });

    
    [self.tabBarController setViewControllers:@[homeNav, postFundraisingNav, shopNav]];
    
    [self customizeTabBarForController];
    
    
    [kSharedAppDelegate.navigationControllerStack pushNavigationController:homeNav];
    
    [[self
      rac_signalForSelector:@selector(tabBarController:didSelectViewController:)
      fromProtocol:@protocol(RDVTabBarControllerDelegate)]
     subscribeNext:^(RACTuple *tuple) {
         //do some thing
         
         [kSharedAppDelegate.navigationControllerStack popNavigationController];
         [kSharedAppDelegate.navigationControllerStack pushNavigationController:tuple.second];
         
     }];
    
    self.tabBarController.delegate = self;
}

- (void)customizeTabBarForController {
    NSArray *tabBarItemImages = @[@"sy",  @"fqzc", @"sc"];
    NSArray *tabBarItemTitles = @[@"首页",  @"排行榜", @"我的"];
    NSArray *items = [[self.tabBarController tabBar] items];
    
    int index = 0;
    for (UITabBarItem *item in items) {
        
        UIImage *selectedImg = [[UIImage imageNamed:kStrFormat(@"%@_a", tabBarItemImages[index])] imageByResizeToSize:CGSizeMake(22, 22) contentMode:UIViewContentModeScaleAspectFill];
        UIImage *unselectedImg = [[UIImage imageNamed:kStrFormat(@"%@", tabBarItemImages[index])] imageByResizeToSize:CGSizeMake(22, 22) contentMode:UIViewContentModeScaleAspectFill];
        [item setImage:unselectedImg];
        [item setSelectedImage:selectedImg];
        [item setTitle:tabBarItemTitles[index]];
        index++;
        
    }
}

- (BOOL)shouldAutorotate {
    return self.tabBarController.selectedViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.tabBarController.selectedViewController.supportedInterfaceOrientations;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.tabBarController.selectedViewController.preferredStatusBarStyle;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
