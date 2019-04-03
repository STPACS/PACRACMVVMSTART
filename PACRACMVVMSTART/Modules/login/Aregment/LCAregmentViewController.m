//
//  LCAregmentViewController.m
//  PACRACMVVMSTART
//
//  Created by chenliang on 2019/4/3.
//  Copyright © 2019 STPACS. All rights reserved.
//

#import "LCAregmentViewController.h"
#import "LCAregmentViewModel.h"

@interface LCAregmentViewController ()<UIWebViewDelegate>
@property (nonatomic , strong) LCAregmentViewModel *viewModel;
@property (nonatomic, strong)UIWebView *myWebView;
@end

@implementation LCAregmentViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [self.view addSubview:self.myWebView];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.myWebView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(60);
        make.left.right.bottom.mas_equalTo(0);
    }];
    
    @weakify(self)
    if (self.viewModel.MESSAGE_ID) {
        self.viewModel.reloadData = ^(NSString *url) {
            @strongify(self)
            [self.myWebView loadHTMLString:url baseURL:nil];
            [self.myWebView setScalesPageToFit:YES];
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.label.text = @"正在加载中...";
            
        };
    } else {
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.viewModel.url]];
        [self.myWebView loadRequest:request];
        [self.myWebView setScalesPageToFit:YES];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.label.text = @"正在加载中...";
        
    }
    
    
}

- (void)back:(UIButton *)sender{
    //    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIWebView *)myWebView{
    if (!_myWebView) {
        _myWebView = [[UIWebView alloc] init];
        _myWebView.backgroundColor = [UIColor whiteColor];
        _myWebView.delegate = self;
    }
    return _myWebView;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
