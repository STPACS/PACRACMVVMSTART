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

@interface PACHomeViewController ()<UIScrollViewDelegate, PACNavChooseScrollViewDelegate>
@property (nonatomic, strong) UIView * leftView;
@property (nonatomic, strong) UIView * rightView;
@property (nonatomic, strong) UIView * middleView;
@property (nonatomic, strong) PACChoseView *navCoureCategoryView;
@property (nonatomic, strong) UIScrollView *backScrollView;
@property (nonatomic, strong) NSMutableArray *navTitleAry;
@property (nonatomic, strong) NSMutableArray *unUserTitleAry;
@end

@implementation PACHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[self leftView]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[self rightView]];
    self.navigationItem.titleView = [self middleView];
    // Do any additional setup after loading the view.
    
    self.navTitleAry = @[@"推荐", @"平面设计", @"影视" ].mutableCopy;
    self.unUserTitleAry = @[@"UI设计", @"网页设计", @"影视世纪",@"No. 1", @"No. 2", @"No. 3", @"No. 4"].mutableCopy;
    [self addOwnViews];
}

//左侧视图
- (UIView *)leftView {
    if (!_leftView) {
        _leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
        _leftView.backgroundColor = [UIColor orangeColor];
        
    }
    return _leftView;
}
//右侧视图
- (UIView *)rightView {
    if (!_rightView) {
        _rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
        _rightView.backgroundColor = [UIColor orangeColor];
        
    }
    return _rightView;
}

- (UIView *)middleView {
    if (!_middleView) {
        _middleView = [[UIView alloc]initWithFrame:CGRectMake(60, 0, SCREEN_WIDTH - 120, 44)];
        _middleView.backgroundColor = [UIColor orangeColor];
        
    }
    return _middleView;
}

//中间视图

//类别视图

//内容视图

- (void)setNavTitleAry:(NSMutableArray *)navTitleAry {
    
    _navTitleAry = navTitleAry;
    self.navCoureCategoryView.modelAry = navTitleAry;
    self.backScrollView.contentSize = CGSizeMake(self.view.frame.size.width * _navTitleAry.count, _backScrollView.frame.size.height);
    [_backScrollView setContentOffset:CGPointMake(0,0)animated:NO];
    
    // 导航栏数据变化移除子控制器
    [self.childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (![obj isKindOfClass:[PacIndexViewController class]]) {
            //[self removeChild:obj];
            [obj removeFromParentViewController];
        }
    }];
}

#pragma mark - delegate
#pragma mark - 导航分类选择代理

- (void)pacNavChooseView:(PACChoseView *)chooseView clickItem:(id)itemModel withIndex:(NSInteger)index {
    
    CGFloat offsetX = index *self.view.frame.size.width;
    [_backScrollView setContentOffset:CGPointMake(offsetX,0)animated:NO];
    [self addChildVCWithIndex: index];
    
}

#pragma mark - ScroollView Delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if (![scrollView isKindOfClass:[UITableView class] ]) {
        CGPoint offset = scrollView.contentOffset;
        _navCoureCategoryView.currentBtnIndex = offset.x/self.view.frame.size.width;
        
        NSInteger index  = offset.x/self.view.frame.size.width;
        [self addChildVCWithIndex: index];
        
    }
}


- (void)addChildVCWithIndex:(NSInteger )index {
    __block BOOL ishasVC = NO;
    [self.childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj.title isEqualToString:self->_navTitleAry[index]]) {
            ishasVC = YES;
        }
    }];
    // 判断是否存在自控制器， 没有添加
    if (ishasVC == YES) {
        return;
    }
    NSString *titleName = _navTitleAry[index];
    PacSecondViewController  *courseVC = [[PacSecondViewController alloc] init];
    courseVC.view.frame = CGRectMake(self.view.frame.size.width * index, 0, self.view.frame.size.width, _backScrollView.frame.size.height);
    [_backScrollView addSubview:courseVC.view];
    courseVC.title = titleName;
    [self addChildViewController:courseVC];
}

#pragma mark -
#pragma mark - button action


// 导航分类选择控制器
- (void)pushToChooseCourseCategoryVC {
    typeof(self) weakSelf = self;
    [[XLChannelControl shareControl] showChannelViewWithInUseTitles:_navTitleAry unUseTitles:_unUserTitleAry finish:^(NSArray *inUseTitles, NSArray *unUseTitles, NSString *title, BOOL isChange) {
        
        if (isChange) {
            weakSelf.navTitleAry = inUseTitles.mutableCopy;
            weakSelf.unUserTitleAry = unUseTitles.mutableCopy;
        }
        
        if (title) {
            // 点击
            [weakSelf.navTitleAry enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([title isEqualToString:obj]) {
                    
                    [self addChildVCWithIndex:idx];
                    
                    weakSelf.navCoureCategoryView.currentBtnIndex = idx;
                    CGFloat offsetX = idx *weakSelf.view.frame.size.width;
                    [weakSelf.backScrollView setContentOffset:CGPointMake(offsetX,0)animated:NO];
                    
                }
            }];
        }
    }];
}


#pragma mark -
#pragma mark - Private method

- (void)addOwnViews {
    [self.view addSubview:self.backScrollView];
    [self setupHomeNav];

    [self.view addSubview:self.navCoureCategoryView];
    // 首页
    PacIndexViewController *courseVC= [[PacIndexViewController alloc] init];
    courseVC.view.frame = CGRectMake(self.view.frame.size.width  * 0, 0, self.view.frame.size.width, _backScrollView.frame.size.width);
    courseVC.title = @"推荐";
    [_backScrollView addSubview:courseVC.view];
    //[self.unUserTitleAry addObject:courseVC];
    [self addChildViewController:courseVC];
    
}

//导航设置
- (void)setupHomeNav{

    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    UIButton *moreCourse = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 44, 64 , 44, 44)];
    [moreCourse setImage:[UIImage imageNamed:@"main_nav_more"] forState:UIControlStateNormal];
    [moreCourse addTarget:self action:@selector(pushToChooseCourseCategoryVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:moreCourse];
}

#pragma mark - lazy

- (PACChoseView *)navCoureCategoryView {
    if (_navCoureCategoryView == nil) {
        
        _navCoureCategoryView  = [[PACChoseView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width - 30 , 40)];
        _navCoureCategoryView.backgroundColor = [UIColor orangeColor];
        _navCoureCategoryView.delegate = self;
        _navCoureCategoryView.modelAry = @[@"推荐"].mutableCopy;
        
        
    }
    return _navCoureCategoryView;
}

- (UIScrollView *)backScrollView {
    if (_backScrollView == nil) {
        _backScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height  - 49)];
        _backScrollView.pagingEnabled = YES;
        _backScrollView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_backScrollView];
        _backScrollView.bounces = NO;
        _backScrollView.delegate = self;
        _backScrollView.contentSize = CGSizeMake(self.view.frame.size.width * 5, _backScrollView.frame.size.height);
    }
    return _backScrollView;
}

- (NSMutableArray *)unUserTitleAry {
    if (_unUserTitleAry == nil) {
        _unUserTitleAry = [[NSMutableArray alloc] init];
    }
    return _unUserTitleAry;
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
