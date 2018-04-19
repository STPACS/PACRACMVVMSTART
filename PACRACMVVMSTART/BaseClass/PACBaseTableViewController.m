//
//  PACBaseTableViewController.m
//  PACRACMVVMSTART
//
//  Created by STPACS on 2018/4/19.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import "PACBaseTableViewController.h"
#import "PACBaseTableViewModel.h"
#import <UIScrollView+EmptyDataSet.h>

@interface PACBaseTableViewController ()
<
UITableViewDelegate,
UITableViewDataSource,
DZNEmptyDataSetDelegate,
DZNEmptyDataSetSource
>

@property (nonatomic , assign , readwrite) UIEdgeInsets contentInset;

@property (nonatomic , strong , readonly) PACBaseTableViewModel *viewModel;

@property (nonatomic , strong , readwrite) RACSignal *requestRemoteDataSignal;

@end

@implementation PACBaseTableViewController

@dynamic viewModel;

- (instancetype)initWithViewModel:(PACBaseViewModel *)viewModel {
    self = [super initWithViewModel:viewModel];
    if (self) {
        if ([viewModel shouldRequestRemoteDataOnViewDidLoad]) {
            @weakify(self);
            [[self rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
                @strongify(self);
                self.requestRemoteDataSignal = [self.viewModel.requestRemoteDataCommand execute:@(self.viewModel.page)];
            }];
        }
    }
    return self;
}

- (void)setView:(UIView *)view {
    [super setView:view];
    if ([view isKindOfClass:UITableView.class]) self.tableView = (UITableView *)view;
}

- (UIEdgeInsets)contentInset {
    return UIEdgeInsetsMake(64, 0, 0, 0);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInset  = self.contentInset;
    self.tableView.scrollIndicatorInsets = self.contentInset;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.alpha = 0.f;
    
    @weakify(self)
    self.viewModel.noMoreDataBlock = ^(BOOL isNoMore) {
        @strongify(self)
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
        
    };
    
    
    if (self.viewModel.shouldPullToRefresh) {
        self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            @strongify(self)
            [[[self.viewModel.requestRemoteDataCommand execute:@0]
              deliverOnMainThread]
             subscribeNext:^(id x) {
                 @strongify(self)
                 self.viewModel.page = 0;
             } error:^(NSError *error) {
                 @strongify(self)
                 [self.tableView.mj_header endRefreshing];
             } completed:^{
                 @strongify(self)
                 [self.tableView.mj_header endRefreshing];
             }];
        }];
    }
    
    if (self.viewModel.shouldInfiniteScrolling) {
        self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            @strongify(self)
            [[[self.viewModel.requestRemoteDataCommand execute:@(self.viewModel.page + 1)]
              deliverOnMainThread]
             subscribeNext:^(RACTuple *x) {
                 @strongify(self)
                 self.viewModel.page += 1;
             } error:^(NSError *error) {
                 @strongify(self)
                 [self.tableView.mj_footer endRefreshing];
             } completed:^{
                 @strongify(self);
                 [self.tableView.mj_footer endRefreshing];
             }];
        }];
    }
    // Do any additional setup after loading the view.
}

- (void)bindViewModel {
    [super bindViewModel];
    
    @weakify(self);
    [[[RACObserve(self.viewModel, dataSource)
       distinctUntilChanged]
      deliverOnMainThread]
     subscribeNext:^(id x) {
         @strongify(self);
         [self reloadData];
     }];
    
    [self.viewModel.requestRemoteDataCommand.executing subscribeNext:^(NSNumber *executing) {
        @strongify(self);
        UIView *emptyDataSetView = [self.tableView.subviews.rac_sequence objectPassingTest:^BOOL(UIView *view) {
            return [NSStringFromClass(view.class) isEqualToString:@"DZNEmptyDataSetView"];
        }];

        emptyDataSetView.origin = CGPointMake(0, -34);
        emptyDataSetView.alpha = 1.0 - executing.floatValue;
    }];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.viewModel.dataSource ? self.viewModel.dataSource.count : 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel.dataSource[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.viewModel.didSelectCommand execute:indexPath];
}

- (void)reloadData {
    [self.tableView reloadData];
    [UIView animateWithDuration:0.7 animations:^{
        self.tableView.alpha = 1.f;
    }];
}

#pragma mark - DZNEmptyDataSetSource
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
//    if (kSharedAppDelegate.networkStatus == AFNetworkReachabilityStatusNotReachable || kSharedAppDelegate.networkStatus == AFNetworkReachabilityStatusUnknown) {
//        return [UIImage imageNamed:@"com_noNet"];
//    }
    return [UIImage imageNamed:@"com_noData"];
}

// 返回显示内容协议
#pragma mark - DZNEmptyDataSetDelegate
- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView {
    return self.viewModel.dataSource == nil || self.viewModel.dataSource.count == 0;
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
    return YES;
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView {
    return -(self.tableView.contentInset.top - self.tableView.contentInset.bottom) / 2;
}

- (void)dealloc {
    _tableView.dataSource = nil;
    _tableView.delegate = nil;
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
