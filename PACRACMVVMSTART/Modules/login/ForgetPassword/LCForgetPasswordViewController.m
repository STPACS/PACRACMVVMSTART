//
//  LCForgetPasswordViewController.m
//  PACRACMVVMSTART
//
//  Created by chenliang on 2019/4/3.
//  Copyright © 2019 STPACS. All rights reserved.
//

#import "LCForgetPasswordViewController.h"
#import "LCForgetPasswordViewModel.h"
#import "LCLoginViewCellTableViewCell.h"

@interface LCForgetPasswordViewController ()<LCLoginViewCellDelegate>
@property (nonatomic , strong) LCForgetPasswordViewModel *viewModel;
@property (nonatomic , strong) UIView *footerView;
@end

@implementation LCForgetPasswordViewController
@dynamic viewModel;

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    UILabel *titleLb = [[UILabel alloc]initWithFrame:CGRectMake(0, 1, SCREEN_WIDTH - 100, 44)];
    titleLb.textAlignment = NSTextAlignmentCenter;
    titleLb.text = @"找回密码";
    self.navigationItem.titleView = titleLb;
    CustomBarItem *leftItem = [self.navigationItem setItemWithImage:@"fh" size:CGSizeMake(16, 16) itemType:left];
    [leftItem setOffset:NAV_ITEM_LEFT_OFFSET];
    @weakify(self)
    [leftItem addBlockForControlEvents:UIControlEventTouchUpInside block:^(id sender) {
        @strongify(self)
        [self.view endEditing:YES];
        [self.viewModel.services popViewModelAnimated:YES];
    }];
    
}

- (void)viewDidLoad {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[LCLoginViewCellTableViewCell class] forCellReuseIdentifier:@"cellID"];
    self.tableView.rowHeight = 65;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.tableFooterView = self.footerView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LCLoginViewCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    [cell bindViewModel:self.viewModel.dataSource[indexPath.section][indexPath.row]];
    cell.delegate = self;
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
- (UIView *)footerView
{
    if (!_footerView) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
        
        UIButton *reSetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_footerView addSubview:reSetBtn];
        [reSetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.right.mas_equalTo(-15);
            make.top.mas_equalTo(35);
            make.height.mas_equalTo(45);
        }];
        reSetBtn.backgroundColor = [PACColorSet getColorMain];
        reSetBtn.layer.cornerRadius = 6;
        reSetBtn.layer.masksToBounds = YES;
        reSetBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [reSetBtn setTitle:@"重置密码" forState:UIControlStateNormal];
        @weakify(self)
        [reSetBtn addBlockForControlEvents:UIControlEventTouchUpInside withBlock:^(UIButton *sender) {
            @strongify(self)
            [self.view endEditing:YES];
            [self.viewModel.didClickResetBtnCmd execute:nil];
        }];
    }
    return _footerView;
}
- (void)clickGetCode
{
    [self.view endEditing:YES];
    [self.viewModel.didClickGetCodeBtnCmd execute:nil];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
