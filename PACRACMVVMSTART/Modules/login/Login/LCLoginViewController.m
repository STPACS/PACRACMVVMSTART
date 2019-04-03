//
//  LCLoginViewController.m
//  PACRACMVVMSTART
//
//  Created by chenliang on 2019/4/3.
//  Copyright © 2019 STPACS. All rights reserved.
//

#import "LCLoginViewController.h"
#import "LCLoginViewCellTableViewCell.h"
#import "LCLoginCellViewModel.h"
#import "LCLoginFooterView.h"
#import "LCloginHeaderView.h"
#import "LCLoginViewModel.h"

@interface LCLoginViewController ()<LCLoginFooterViewDelegate>
@property (nonatomic , strong) LCLoginViewModel *viewModel;
@property (nonatomic , strong) LCloginHeaderView *headerView;
@property (nonatomic , strong) LCLoginFooterView *footerView;

@end

@implementation LCLoginViewController
@dynamic viewModel;

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
   
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
- (LCloginHeaderView *)headerView
{
    if (!_headerView) {
        _headerView = [[LCloginHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 121)];
    }
    return _headerView;
}
- (LCLoginFooterView *)footerView
{
    if (!_footerView) {
        _footerView = [[LCLoginFooterView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 380)];
        _footerView.delegate = self;
    }
    return _footerView;
}

-(void)clickLoginBtn
{
    MYLog(@"点击了登录");
    [self.view endEditing:YES];
    [self.viewModel.didClickLoginBtnCmd execute:nil];
}
-(void)clickRegisterBtn
{
    MYLog(@"点击了注册");
    [self.viewModel.didClickRegisterBtnCmd execute:nil];
    
}
-(void)clickForgetPasswordBtn
{
    MYLog(@"点击了忘记密码");
    [self.viewModel.didClickForgetPasswordBtnCmd execute:nil];
}
- (void)clickQQBtn
{
//    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_QQ currentViewController:nil completion:^(id result, NSError *error) {
//        if (error) {
//
//        } else {
//            UMSocialUserInfoResponse *resp = result;
//
//            [self.viewModel.didClickWeiXinBtn execute:resp];
//
//            // 授权信息
//            MYLog(@"QQ uid: %@", resp.uid);
//            MYLog(@"QQ openid: %@", resp.openid);
//            //            MYLog(@"QQ unionid: %@", resp.unionId);
//            MYLog(@"QQ accessToken: %@", resp.accessToken);
//            MYLog(@"QQ expiration: %@", resp.expiration);
//
//            // 用户信息
//            MYLog(@"QQ name: %@", resp.name);
//            MYLog(@"QQ iconurl: %@", resp.iconurl);
//            //            MYLog(@"QQ gender: %@", resp.unionGender);
//
//            // 第三方平台SDK源数据
//            MYLog(@"QQ originalResponse: %@", resp.originalResponse);
//        }
//    }];
    
}
-(void)clickWeiXinBtn
{
    
//    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_WechatSession currentViewController:nil completion:^(id result, NSError *error) {
//        if (error) {
//            MYLog(@"Wechat uid: 错误 %@，",error);
//
//        } else {
//            UMSocialUserInfoResponse *resp = result;
//
//            [self.viewModel.didClickWeiXinBtn execute:resp];
//
//
//            // 授权信息
//            MYLog(@"Wechat uid: %@", resp.uid);
//            MYLog(@"Wechat openid: %@", resp.openid);
//            //            MYLog(@"Wechat unionid: %@", resp.unionId);
//            MYLog(@"Wechat accessToken: %@", resp.accessToken);
//            MYLog(@"Wechat refreshToken: %@", resp.refreshToken);
//            MYLog(@"Wechat expiration: %@", resp.expiration);
//
//            // 用户信息
//            MYLog(@"Wechat name: %@", resp.name);
//            MYLog(@"Wechat iconurl: %@", resp.iconurl);
//            //            MYLog(@"Wechat gender: %@", resp.unionGender);
//
//            // 第三方平台SDK源数据
//            MYLog(@"Wechat originalResponse: %@", resp.originalResponse);
//        }
//    }];
    
    //    MYLog(@"点击了微信登录");
    //#pragma mark - 微信登录
    //    /*
    //     目前移动应用上德微信登录只提供原生的登录方式，需要用户安装微信客户端才能配合使用。
    //     对于iOS应用,考虑到iOS应用商店审核指南中的相关规定，建议开发者接入微信登录时，先检测用户手机是否已经安装
    //     微信客户端(使用sdk中的isWXAppInstall函数),对于未安装的用户隐藏微信 登录按钮，只提供其他登录方式。
    //     */
    //    if ([WXApi isWXAppInstalled]) {
    //        SendAuthReq *req = [[SendAuthReq alloc] init];
    //        req.scope = @"snsapi_userinfo";
    //        req.state = @"App";
    //        [WXApi sendReq:req];
    //    }else {
    //        [self setupAlertController];
    //    }
    
}



#pragma mark - 设置弹出提示语
- (void)setupAlertController {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请先安装微信客户端" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actionConfirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:actionConfirm];
    [self presentViewController:alert animated:YES completion:nil];
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
