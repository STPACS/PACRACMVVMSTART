//
//  PACBaseTableViewController.h
//  PACRACMVVMSTART
//
//  Created by STPACS on 2018/4/19.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import "PACBaseViewController.h"

@interface PACBaseTableViewController : PACBaseViewController

@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , assign , readonly) UIEdgeInsets contentInset;

@property (nonatomic , strong , readonly) RACSignal *requestRemoteDataSignal;

- (void)reloadData;
@end
