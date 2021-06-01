//
//  toolViewController.m
//  signIn
//
//  Created by xuchenfei on 2021/4/12.
//

#import "toolViewController.h"
#import "calculatorViewController.h"
#import "nowWeatherViewController.h"
#import "ariQualityViewController.h"
#import "sevenWeatherViewController.h"
#import "warmingInfoViewController.h"
#import "vehicleConditionViewController.h"

@interface toolViewController ()

@property (strong,nonatomic) UILabel *titleLabel;
@property (strong,nonatomic) UILabel *recommendLabel;
@property (strong,nonatomic) UILabel *commonUseLabel;

@property (strong,nonatomic) UIImageView *calculatorView;
@property (strong,nonatomic) UIImageView *nowWeatherView;
@property (strong,nonatomic) UIImageView *airQualityView;
@property (strong,nonatomic) UIImageView *sevenWeatherView;
@property (strong,nonatomic) UIImageView *warmingInfoView;
@property (strong,nonatomic) UIImageView *vehicleConditionView;

@end

@implementation toolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"工具箱";
    UIFont *font = [UIFont fontWithName:@"Arial-ItalicMT" size:26];
    NSDictionary *dic = @{NSFontAttributeName:font,
    NSForegroundColorAttributeName: [UIColor blackColor]};
    self.navigationController.navigationBar.titleTextAttributes = dic;
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.commonUseLabel];
    [self.view addSubview:self.recommendLabel];
    
    [self.view addSubview:self.calculatorView];
    [self.view addSubview:self.nowWeatherView];
    [self.view addSubview:self.airQualityView];
    [self.view addSubview:self.sevenWeatherView];
    [self.view addSubview:self.warmingInfoView];
    [self.view addSubview:self.vehicleConditionView];
    
    
}
#pragma  action

- (void)pushCalculatorContorller {
    [self.navigationController pushViewController:[[calculatorViewController alloc]init] animated:YES];
}

- (void)pushNowWeatherContorller {
    [self.navigationController pushViewController:[[nowWeatherViewController alloc]init] animated:YES];
}

- (void)pushAirQualityContorller {
    [self.navigationController pushViewController:[[ariQualityViewController alloc]init] animated:YES];
}

- (void)pushSevenWeatherContorller {
    [self.navigationController pushViewController:[[sevenWeatherViewController alloc]init] animated:YES];
}
- (void)pushWarmingInfoContorller {
    [self.navigationController pushViewController:[[warmingInfoViewController alloc]init] animated:YES];
}
- (void)pushVehicleConditionContorller {
    [self.navigationController pushViewController:[[vehicleConditionViewController alloc]init] animated:YES];
}





#pragma  lazyloading

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(170, 40, 160, 40)];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.text = @"工具箱";
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:25];
    }
    return _titleLabel;
}

- (UILabel *)recommendLabel {
    if (!_recommendLabel) {
        _recommendLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 110, 160, 20)];
        _recommendLabel.backgroundColor = [UIColor whiteColor];
        _recommendLabel.text = @"推荐功能";
        _recommendLabel.textColor = [UIColor blackColor];
        _recommendLabel.font = [UIFont systemFontOfSize:20];
//        UIView *v1 = [[UIView alloc]initWithFrame:CGRectMake(10, 135, self.view.frame.size.width-10, 6)];
//        v1.backgroundColor = [UIColor blueColor];
//        [self.view addSubview:v1];
    }
    return _recommendLabel;
}

- (UIImageView *)calculatorView {
    if (!_calculatorView) {
        _calculatorView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 155, 80, 80)];
        _calculatorView.image = [UIImage imageNamed:@"calculator.png"];
        [self.view addSubview:self.calculatorView];
        _calculatorView.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushCalculatorContorller)];
        [self.calculatorView addGestureRecognizer:singleTap];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(34, 240, 60, 40)];
        label.text = @"计算器";
        [self.view addSubview:label];
    }
    return _calculatorView;
}


- (UILabel *)commonUseLabel {
    if (!_commonUseLabel) {
        _commonUseLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 300, 160, 20)];
        _commonUseLabel.backgroundColor = [UIColor whiteColor];
        _commonUseLabel.text = @"常用功能";
        _commonUseLabel.textColor = [UIColor blackColor];
        _commonUseLabel.font = [UIFont systemFontOfSize:20];
    }
    return _commonUseLabel;
}

- (UIImageView *)nowWeatherView {
    if (!_nowWeatherView) {
        _nowWeatherView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 345, 80, 80)];
        _nowWeatherView.image = [UIImage imageNamed:@"nowWeather.png"];
        [self.view addSubview:self.nowWeatherView];
        _nowWeatherView.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushNowWeatherContorller)];
        [self.nowWeatherView addGestureRecognizer:singleTap];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(24, 430, 100, 40)];
        label.text = @"实时天气";
        [self.view addSubview:label];
    }
    return _nowWeatherView;
}

- (UIImageView *)airQualityView {
    if (!_airQualityView) {
        _airQualityView = [[UIImageView alloc]initWithFrame:CGRectMake(160, 345, 70, 70)];
        _airQualityView.image = [UIImage imageNamed:@"airQuality.png"];
        _airQualityView.userInteractionEnabled = YES;
        _airQualityView.clipsToBounds = YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushAirQualityContorller)];
        [self.airQualityView addGestureRecognizer:singleTap];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(164, 430, 100, 40)];
        label.text = @"空气质量";
        [self.view addSubview:label];
    }
    return _airQualityView;
}

- (UIImageView *)sevenWeatherView {
    if (!_sevenWeatherView) {
        _sevenWeatherView = [[UIImageView alloc]initWithFrame:CGRectMake(300, 345, 70, 70)];
        _sevenWeatherView.image = [UIImage imageNamed:@"sevenWeather.png"];
        _sevenWeatherView.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushSevenWeatherContorller)];
        [self.sevenWeatherView addGestureRecognizer:singleTap];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(304, 430, 100, 40)];
        label.text = @"近期天气";
        [self.view addSubview:label];
    }
    return _sevenWeatherView;
}

- (UIImageView *)warmingInfoView {
    if (!_warmingInfoView) {
        _warmingInfoView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 485, 70, 70)];
        _warmingInfoView.image = [UIImage imageNamed:@"warmingInfo.png"];
        _warmingInfoView.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushWarmingInfoContorller)];
        [self.warmingInfoView addGestureRecognizer:singleTap];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 565, 100, 40)];
        label.text = @"预警信息";
        [self.view addSubview:label];
    }
    return _warmingInfoView;
}

- (UIImageView *)vehicleConditionView {
    if (!_vehicleConditionView) {
        _vehicleConditionView = [[UIImageView alloc]initWithFrame:CGRectMake(160, 485, 75, 75)];
        _vehicleConditionView.image = [UIImage imageNamed:@"vehicleCondition.png"];
        _vehicleConditionView.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushVehicleConditionContorller)];
        [self.vehicleConditionView addGestureRecognizer:singleTap];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(164, 565, 100, 40)];
        label.text = @"车辆限行";
        [self.view addSubview:label];
    }
    return _vehicleConditionView;
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
