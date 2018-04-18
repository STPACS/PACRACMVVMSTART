//
//  PACBaseViewController.m
//  PACRACMVVMSTART
//
//  Created by Mr. Chen on 2018/4/18.
//  Copyright © 2018年 STPACS. All rights reserved.
//

#import "PACBaseViewController.h"

@interface PACBaseViewController ()
@property (nonatomic , strong , readwrite) PACBaseViewModel *viewModel;

@end

@implementation PACBaseViewController

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    PACBaseViewController *viewController = [super allocWithZone:zone];
    @weakify(viewController);
    [[viewController rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
       @strongify(viewController)
        [viewController bindViewModel];
    }];
    return viewController;
}

- (instancetype)initWithViewModel:(PACBaseViewModel *)viewModel{
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;
    
    // Do any additional setup after loading the view.
}

- (void)bindViewModel
{
    
    RAC(self, title) = RACObserve(self.viewModel, title);
    
    [self.viewModel.errors subscribeNext:^(NSError *error) {
        
      
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (self.viewModel.shouldNavBackItem) {
        CustomBarItem *leftItem = [self.navigationItem setItemWithImage:@"sys_fanhui" size:CGSizeMake(44, 44) itemType:left];
        [leftItem setOffset:NAV_ITEM_LEFT_OFFSET];
        @weakify(self)
        [leftItem addBlockForControlEvents:UIControlEventTouchUpInside block:^(id sender) {
            @strongify(self)
            [self.view endEditing:YES];
            [self.viewModel.services popViewModelAnimated:YES];
    
        }];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.viewModel.willDisappearSignal sendNext:nil];
}

- (void)pushPostViewModel:(PACBaseViewModel *)viewModel
{
    [self.viewModel.services pushViewModel:viewModel animated:YES];
}
- (BOOL)shouldAutorotate {
    return YES;
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
