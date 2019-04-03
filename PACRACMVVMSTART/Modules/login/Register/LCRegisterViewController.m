//
//  LCRegisterViewController.m
//  PACRACMVVMSTART
//
//  Created by chenliang on 2019/4/3.
//  Copyright © 2019 STPACS. All rights reserved.
//

#import "LCRegisterViewController.h"
#import "LCRegisterHeaderView.h"
#import "LCRegisterFooterView.h"
#import "LCRegisterViewModel.h"
#import "LCLoginViewCellTableViewCell.h"

@interface LCRegisterViewController ()<LCRegisterFooterViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,LCLoginViewCellDelegate>
@property (nonatomic , strong) LCRegisterViewModel *viewModel;
@property (nonatomic , strong) LCRegisterHeaderView *headerView;
@property (nonatomic , strong) LCRegisterFooterView *footerView;
@end

@implementation LCRegisterViewController
@dynamic viewModel;

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    //    UILabel *titleLb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 100, 44)];
    //    titleLb.textAlignment = NSTextAlignmentCenter;
    //    titleLb.text = @"";
    //    self.navigationItem.titleView = titleLb;
    CustomBarItem *rightItem = [self.navigationItem setItemWithImage:@"gb" size:CGSizeMake(16, 16) itemType:right];
    [rightItem setOffset:NAV_ITEM_RIGHT_OFFSET];
    @weakify(self)
    [rightItem addBlockForControlEvents:UIControlEventTouchUpInside block:^(id sender) {
        @strongify(self)
        [self.view endEditing:YES];
        [self.viewModel.services popViewModelAnimated:YES];
    }];
    
    self.viewModel.verifyPhoneEmety = ^{
        
    };
    
}

- (void)viewDidLoad {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    [super viewDidLoad];
    
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[LCLoginViewCellTableViewCell class] forCellReuseIdentifier:@"cellID"];
    self.tableView.rowHeight = 67;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.tableHeaderView = self.headerView;
    self.tableView.tableFooterView = self.footerView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LCLoginViewCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    cell.delegate = self;
    [cell bindViewModel:self.viewModel.dataSource[indexPath.section][indexPath.row]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.001f;
}
- (LCRegisterHeaderView *)headerView
{
    if (!_headerView) {
        _headerView = [[LCRegisterHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 80)];
       
    }
    return _headerView;
}
- (LCRegisterFooterView *)footerView
{
    if (!_footerView) {
        _footerView = [[LCRegisterFooterView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
        _footerView.delegate = self;
    }
    return _footerView;
}

- (void)clickDoctorRegisterIsDoctor:(BOOL)isDoctor {
    [self.view endEditing:YES];
    [self.viewModel.didClickrRegistCmd execute:nil];
}

- (void)clickUserArgement {
    [self.viewModel.didClickUserAregmentCmd execute:nil];
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}
- (void)clickGetCode
{
    //首先验证手机号是否已经注册。如果已经注册提示已经注册。如果没有注册再获取验证码注册
    [self.view endEditing:YES];
    [self.viewModel.didClickGetCodeBtnCmd execute:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
