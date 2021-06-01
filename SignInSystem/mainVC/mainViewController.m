//
//  mainViewController.m
//  signIn
//
//  Created by xuchenfei on 2021/4/6.
//

#import <Foundation/Foundation.h>
#import "mainViewController.h"
#import "JSToastDialogs.h"
#import "newsTableViewController.h"
#import "currentTaskViewController.h"
#import "applyForViewController.h"
#import "waitToBeDoneViewController.h"
#import "publishTaskViewController.h"
#import "shouDataViewController.h"
#import "studentApplyViewController.h"

@interface mainViewController ()
@property (strong,nonatomic) UIImageView *qiandaoBgView;
@property (strong,nonatomic) UIImageView *gongnengBgView;
@property (strong,nonatomic) UIImageView *renwuView;
@property (strong,nonatomic) UIImageView *buqianView;
@property (strong,nonatomic) UIImageView *daibanView;
@property (strong,nonatomic) UIImageView *fabuView;
@property (strong,nonatomic) UIImageView *shujuView;
@property (strong,nonatomic) UIImageView *shenqingView;



@property (strong,nonatomic) UILabel *tishiLabel;
@property (strong,nonatomic) UILabel *timeLabel;
@property (strong,nonatomic) UILabel *netLabel;
@property (strong,nonatomic) UILabel *faxianLabel;
@property (strong,nonatomic) UILabel *qiandaoLabel;
@property (strong,nonatomic) UILabel *jiaoshiLabel;
@property (strong,nonatomic) UILabel *grayLabel;
@property (strong,nonatomic) UILabel *chakanrenwuLabel;
@property (strong,nonatomic) UILabel *buqianLabel;
@property (strong,nonatomic) UILabel *daibanLabel;
@property (strong,nonatomic) UILabel *fabuLabel;
@property (strong,nonatomic) UILabel *shujuLabel;
@property (strong,nonatomic) UILabel *shenqingLabel;




@end

@implementation mainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarItem.title = @"签到";
    self.tabBarItem.image = [[UIImage imageNamed:@"signin1.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem.selectedImage = [[UIImage imageNamed:@"signin2.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.isStudent = NO;
    
    _netLabel = [[UILabel alloc]initWithFrame:CGRectMake(200, 140, 170, 50)];
    _netLabel.text = @"网络数据模拟开关";
    _netLabel.font = [UIFont systemFontOfSize:20];
    _netLabel.textColor = [UIColor blackColor];
    _netLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:_netLabel];

    self.faxianLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, 80, 40)];
    self.faxianLabel.font = [UIFont fontWithName:@ "Arial Rounded MT Bold"  size:(36.0)];
    self.faxianLabel.text = @"发现";
    [self.view addSubview:self.faxianLabel];
    
    self.tishiLabel = [[UILabel alloc]initWithFrame:CGRectMake(110, 110, 280, 40)];
    self.tishiLabel.font = [UIFont systemFontOfSize:16];;
    self.tishiLabel.text = @"及时签到，做一个优秀的学生哦";
    [self.view addSubview:self.tishiLabel];
    
    self.qiandaoBgView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 180, self.view.frame.size.width-40, 170)];
    self.qiandaoBgView.image = [UIImage imageNamed:@"qiandaobg.jpg"];
    [self.view addSubview:self.qiandaoBgView];
    
    self.qiandaoLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 250, 350, 40)];
    self.qiandaoLabel.text = @"当前有3个签到任务";
    self.qiandaoLabel.font = [UIFont fontWithName:@ "Arial Rounded MT Bold"  size:(38.0)];
    [self.view addSubview:self.qiandaoLabel];
    
    self.gongnengBgView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 380, self.view.frame.size.width-40, 250)];
    self.gongnengBgView.image = [UIImage imageNamed:@"gongnengbg.jpg"];
    [self.view addSubview:self.gongnengBgView];
    
    self.renwuView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 390,60, 60)];
    self.renwuView.image = [UIImage imageNamed:@"renwu.png"];
    [self.view addSubview:self.renwuView];
    
    self.chakanrenwuLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 440, 100, 60)];
    self.chakanrenwuLabel.text = @"当前任务";
    self.chakanrenwuLabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:_chakanrenwuLabel];
    
    self.buqianView = [[UIImageView alloc]initWithFrame:CGRectMake(160, 390,60, 60)];
    self.buqianView.image = [UIImage imageNamed:@"buqian.png"];
    [self.view addSubview:self.buqianView];
    
    self.buqianLabel = [[UILabel alloc]initWithFrame:CGRectMake(160, 440, 100, 60)];
    self.buqianLabel.text = @"申请补签";
    self.buqianLabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:self.buqianLabel];
    
    self.daibanView = [[UIImageView alloc]initWithFrame:CGRectMake(280, 390,60, 60)];
    self.daibanView.image = [UIImage imageNamed:@"daiban.png"];
    [self.view addSubview:self.daibanView];
    
    self.daibanLabel = [[UILabel alloc]initWithFrame:CGRectMake(280, 440, 100, 60)];
    self.daibanLabel.text = @"待办签到";
    self.daibanLabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:self.daibanLabel];
    
    self.jiaoshiLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 640, 180, 40)];
    self.jiaoshiLabel.font = [UIFont fontWithName:@ "Arial Rounded MT Bold"  size:(33.0)];
    self.jiaoshiLabel.text = @"教师功能";
    [self.view addSubview:self.jiaoshiLabel];
    
    self.grayLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 690, 390, 6)];
    self.grayLabel.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.grayLabel];
    
    self.fabuView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 720,60, 60)];
    self.fabuView.image = [UIImage imageNamed:@"fabu.png"];
    [self.view addSubview:self.fabuView];
    
    self.fabuLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 780, 100, 60)];
    self.fabuLabel.text = @"发布签到";
    self.fabuLabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:self.fabuLabel];
    
    self.shujuView = [[UIImageView alloc]initWithFrame:CGRectMake(160, 720,60, 60)];
    self.shujuView.image = [UIImage imageNamed:@"shuju.png"];
    [self.view addSubview:self.shujuView];
    
    self.shujuLabel = [[UILabel alloc]initWithFrame:CGRectMake(160, 780, 100, 60)];
    self.shujuLabel.text = @"查看数据";
    self.shujuLabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:self.shujuLabel];
    
    self.shenqingView = [[UIImageView alloc]initWithFrame:CGRectMake(280, 720,60, 60)];
    self.shenqingView.image = [UIImage imageNamed:@"shenqing.png"];
    [self.view addSubview:self.shenqingView];
    
    self.shenqingLabel = [[UILabel alloc]initWithFrame:CGRectMake(280, 780, 100, 60)];
    self.shenqingLabel.text = @"查看申请";
    self.shenqingLabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:self.shenqingLabel];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeLogStatus:) name:@"logInMessage" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeLogOutStatus:) name:@"logOutMessage" object:nil];

    self.renwuView.userInteractionEnabled = YES;
    self.buqianView.userInteractionEnabled = YES;
    self.shenqingView.userInteractionEnabled = YES;
    self.daibanView.userInteractionEnabled = YES;
    self.fabuView.userInteractionEnabled = YES;
    self.shujuView.userInteractionEnabled = YES;
   
    [self addTapGestureToTurnOnNetView];
    UITapGestureRecognizer *singleTap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushDangQianRenWuContorller:)];
    [self.renwuView addGestureRecognizer:singleTap1];
    UITapGestureRecognizer *singleTap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushShenQingBuQianContorller:)];
    [self.buqianView addGestureRecognizer:singleTap2];
    UITapGestureRecognizer *singleTap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushDaiBanQianDaoContorller:)];
    [self.daibanView addGestureRecognizer:singleTap3];
    UITapGestureRecognizer *singleTap4 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushFaBuQianDaoContorller:)];
    [self.fabuView addGestureRecognizer:singleTap4];
    UITapGestureRecognizer *singleTap5 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushChaKanShuJuContorller:)];
    [self.shujuView addGestureRecognizer:singleTap5];
    UITapGestureRecognizer *singleTap6 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushChaKanShenQingContorller:)];
    [self.shenqingView addGestureRecognizer:singleTap6];
    
}
#pragma action
- (void) addTapGestureToTurnOnNetView {
    UIGestureRecognizer *singelTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(turnOnNetAction)]; self.netLabel.userInteractionEnabled = YES;
    [_netLabel addGestureRecognizer:singelTap];
}

- (void) turnOnNetAction {
    [[JSToastDialogs shareInstance] makeToast:@"数据模拟已开启" duration:1.0];
    [self.netLabel removeFromSuperview];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(ChangeNetStatus:) name:@"netMessage" object:nil];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"netMessage" object:@""];
    
}

- (void) ChangeNetStatus: (NSNotification *)notification {
    
}

- (void) changeLogStatus: (NSNotification *)notification {
    self.isLogIn = YES;
}

- (void) changeLogOutStatus: (NSNotification *)notification {
    self.isLogIn = NO;
}

- (void)pushDangQianRenWuContorller: (UITapGestureRecognizer *)sender{
    [self.navigationController pushViewController:[[currentTaskViewController alloc]init] animated:YES];
}

- (void)pushShenQingBuQianContorller: (UITapGestureRecognizer *)sender{
    [self.navigationController pushViewController:[[applyForViewController alloc]init] animated:YES];
}

- (void)pushDaiBanQianDaoContorller: (UITapGestureRecognizer *)sender{
    [self.navigationController pushViewController:[[waitToBeDoneViewController alloc]init] animated:YES];
}

- (void)pushFaBuQianDaoContorller: (UITapGestureRecognizer *)sender{
    if (!_isStudent){
        [self.navigationController pushViewController:[[publishTaskViewController alloc]init] animated:YES];
    }else {
        [[JSToastDialogs shareInstance] makeToast:@"没有权限" duration:1.0];
    }
}

- (void)pushChaKanShuJuContorller: (UITapGestureRecognizer *)sender{
    if (!_isStudent){
        [self.navigationController pushViewController:[[shouDataViewController alloc]init] animated:YES];
    }else {
        [[JSToastDialogs shareInstance] makeToast:@"没有权限" duration:1.0];
    }
}

- (void)pushChaKanShenQingContorller: (UITapGestureRecognizer *)sender{
    if (!_isStudent){
        [self.navigationController pushViewController:[[studentApplyViewController alloc]init] animated:YES];
    }else {
        [[JSToastDialogs shareInstance] makeToast:@"没有权限" duration:1.0];
    }
}

#pragma  laze load;


@end
