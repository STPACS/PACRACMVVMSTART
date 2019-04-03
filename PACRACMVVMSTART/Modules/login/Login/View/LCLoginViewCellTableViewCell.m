//
//  LCLoginViewCellTableViewCell.m
//  PACRACMVVMSTART
//
//  Created by chenliang on 2019/4/3.
//  Copyright © 2019 STPACS. All rights reserved.
//

#import "LCLoginViewCellTableViewCell.h"
#import "LCLoginCellViewModel.h"

@interface LCLoginViewCellTableViewCell ()<UITextFieldDelegate>
@property (nonatomic , strong) LCLoginCellViewModel *viewModel;
@property (nonatomic , strong) UITextField *textFiled;
@property (nonatomic , strong) UIImageView *leftIconIv;
@property (nonatomic , strong) UIButton *getCodeBtn;
@end

@implementation LCLoginViewCellTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupViews];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startTime) name:@"VerifyPhoneEmetyNotification" object:nil];
    }
    return self;
}
- (void)setupViews
{
    self.backgroundColor = [UIColor whiteColor];
    
    UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 42, 20)];
    
    _leftIconIv = [[UIImageView alloc] initWithFrame:CGRectMake(18, 0, 14, 20)];
    _leftIconIv.contentMode = UIViewContentModeCenter;
    //    _leftIconIv.image = [UIImage imageNamed:@"sj"];
    [leftView addSubview:_leftIconIv];
    
    
    self.textFiled = ({
        UITextField *tf = [[UITextField alloc] init];
        [self.contentView addSubview:tf];
        [tf mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.right.mas_equalTo(-15);
            make.height.mas_equalTo(41);
            make.bottom.mas_equalTo(0);
        }];
        tf.textColor = [PACColorSet getColorMain];
        tf.leftView = leftView;
        tf.leftViewMode = UITextFieldViewModeAlways;
        tf.clearButtonMode = UITextFieldViewModeWhileEditing;
        tf.font = [UIFont systemFontOfSize:15];
        tf.delegate = self;
        tf.keyboardType = self.viewModel.keyboardType;
        @weakify(self)
        [tf addObserverBlockForKeyPath:@"text" block:^(id  _Nonnull obj, id  _Nullable oldVal, id  _Nullable newVal) {
            @strongify(self)
            self.viewModel.contentText = newVal;
        }];
        tf;
    });
    
    self.getCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:_getCodeBtn];
    [_getCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-29);
        make.centerY.mas_equalTo(0);
    }];
    [_getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_getCodeBtn setTitleColor:[PACColorSet getColorMain] forState:UIControlStateNormal];
    _getCodeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    _getCodeBtn.hidden = YES;
    @weakify(self)
    [_getCodeBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(UIButton *sender) {
        @strongify(self)
        
        [self.delegate clickGetCode];
    }];
    
    
    UIView *line = [UIView new];
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
    line.backgroundColor = [PACColorSet getColorMain];
}

-(void)startTime{
    __block int timeout = 60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self.getCodeBtn setTitle:[NSString stringWithFormat:@"获取验证码"] forState:UIControlStateNormal];
                self.getCodeBtn.userInteractionEnabled = YES;
            });
        }else{
            int seconds = timeout % 120;
            NSString *strTime = [NSString stringWithFormat:@"%d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                self.getCodeBtn.userInteractionEnabled = NO;
                [self.getCodeBtn setTitle:[NSString stringWithFormat:@"%@秒",strTime] forState:UIControlStateNormal];
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

- (void)bindViewModel:(LCLoginCellViewModel *)viewModel
{
    _viewModel = viewModel;
    _leftIconIv.image = [UIImage imageNamed:viewModel.leftIconImageStr];
    _textFiled.placeholder = viewModel.placeHolderStr;
    _textFiled.keyboardType = viewModel.keyboardType;
    _getCodeBtn.hidden = !viewModel.getCodeIsHiden;
    _textFiled.secureTextEntry = viewModel.secureTextEntry;
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"VerifyPhoneEmetyNotification" object:nil];
    [self.textFiled removeObserverBlocks];
}

@end
