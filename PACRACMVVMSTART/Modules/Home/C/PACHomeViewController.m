//
//  PACHomeViewController.m
//  PACRACMVVMSTART
//
//  Created by STPACS on 2018/4/19.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import "PACHomeViewController.h"
#import "PACChoseView.h"
#import "XLChannelControl.h"
#import "PacIndexViewController.h"
#import "PacSecondViewController.h"
#import "PACHomeViewModel.h"

@interface PACHomeViewController ()

@property (nonatomic, strong)PACHomeViewModel *viewModel;

@end

@implementation PACHomeViewController
@dynamic viewModel;

- (void)rightBtnAction :(UIBarButtonItem *)btn {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    CustomBarItem *leftItem = [self.navigationItem setItemWithTitle:@"切换" textColor:[UIColor blackColor] fontSize:20 itemType:left];
    [leftItem setOffset:NAV_ITEM_LEFT_OFFSET];
    @weakify(self)
    [leftItem addBlockForControlEvents:UIControlEventTouchUpInside block:^(id sender) {
        @strongify(self)
        [zhThemeOperator changeThemeDayOrNight];
    }];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"切换" forState:UIControlStateNormal];
    
    [button zh_themeUpdateCallback:^(id  _Nonnull target) {
       
        [target setTitleColor:ThemePickerColorKey(@"color02").color forState:UIControlStateNormal];
    }];
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = rightBtn;
   
    
//    
//    CustomBarItem *rightItem = [self.navigationItem setItemWithTitle:@"切换2" textColor:ThemePickerColorKey(@"color02").color fontSize:20 itemType:right];
//    [rightItem setOffset:NAV_ITEM_RIGHT_OFFSET];
//    
//    [rightItem addBlockForControlEvents:UIControlEventTouchUpInside block:^(id sender) {
//        @strongify(self)
//        [[UIScreen mainScreen] setBrightness: 0.2];
//        [self.viewModel.taobao execute:nil];
//    }];

    
    
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
