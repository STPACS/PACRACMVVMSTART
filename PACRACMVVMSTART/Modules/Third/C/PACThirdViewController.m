//
//  PACThirdViewController.m
//  PACRACMVVMSTART
//
//  Created by STPACS on 2018/4/19.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import "PACThirdViewController.h"
#import "PACThirdViewModel.h"

@interface PACThirdViewController ()
@property (nonatomic, strong)PACThirdViewModel *viewModel;

@end

@implementation PACThirdViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"登录" forState:UIControlStateNormal];
    
    [button zh_themeUpdateCallback:^(id  _Nonnull target) {
        
        [target setTitleColor:ThemePickerColorKey(@"color02").color forState:UIControlStateNormal];
    }];
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    [button addBlockForControlEvents:UIControlEventTouchUpInside withBlock:^(id sender) {
        [self.viewModel.presentLoginControllerCmd execute:nil];
    }];
    
    
    // Do any additional setup after loading the view.
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
