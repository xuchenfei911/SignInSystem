//
//  publishTaskViewController.m
//  SignInSystem
//
//  Created by bytedance on 2021/5/12.
//

#import "publishTaskViewController.h"
#import "personInfoViewController.h"
#import "JSToastDialogs.h"
#import "qrCodeViewController.h"
@interface publishTaskViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>


@property (strong,nonatomic) UIView *logInContainerView;
@property (strong,nonatomic) UILabel *dataLabel;
@property (nonatomic,copy) UITextField *getDataField;
@property (strong,nonatomic) UILabel *stuNumLabel;
@property (nonatomic,copy) UITextField *getStuNumField;
@property (nonatomic,copy)NSString *stuNum;
@property (strong,nonatomic) UILabel *stuPwdLabel;
@property (nonatomic,copy) UITextField *getStuPwdField;
@property (nonatomic,copy) UILabel *typeLabel;
@property (nonatomic,strong) UILabel *stuTypeLabel;
@property (nonatomic,copy) NSString *stuPwd;
@property (nonatomic,copy) UITextField *getStuTypeField;
@property (nonatomic,copy) NSString *stuType;
@property (strong,nonatomic) UILabel *logInLabel;
@property (strong,nonatomic)UILabel *courseNumLabel;
@property (nonatomic,copy) UITextField *getCourseNumField;
@property (strong,nonatomic)UILabel *qrCodeLabel;


@end

@implementation publishTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.logInContainerView];
    [self addTapGestureToLogInLabelView];
    [self addTapGestureToQrCodeLabelView];
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent *)event{

[self.view endEditing:YES]; //实现该方法是需要注意view需要是继承UIControl而来的

}

- (void) addTapGestureToLogInLabelView {
    UIGestureRecognizer *singelTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(logInAction)];
    self.logInLabel.userInteractionEnabled = YES;
    [_logInLabel addGestureRecognizer:singelTap];
}

- (void) addTapGestureToQrCodeLabelView {
    UIGestureRecognizer *singelTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gennerateQrCode)];
    self.qrCodeLabel.userInteractionEnabled = YES;
    [_qrCodeLabel addGestureRecognizer:singelTap];
}

- (void) logInAction {
        [[JSToastDialogs shareInstance] makeToast:@"发布成功" duration:1.0];
        return ;
}

- (void) gennerateQrCode {
    qrCodeViewController *controller = [[qrCodeViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
        return ;
}

- (void) stuNumTextFieldDidChange:(UITextField*) sender {
    _stuNum = sender.text;
}

- (void) stuPwdTextFieldDidChange:(UITextField*) sender {
    _stuPwd = sender.text;
}

- (void) stuTypeTextFieldDidChange:(UITextField*) sender {
    _stuType = sender.text;
}

- (UIView *)logInContainerView {
    if (!_logInContainerView) {
        _logInContainerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size
                                                                      .height)];
        _logInContainerView.backgroundColor = [UIColor whiteColor];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        imageView.image = [UIImage imageNamed:@"dashuju.jpg"];
        //[imageView sizeToFit];
        [_logInContainerView addSubview:imageView];
        
        _dataLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 160, 90, 70)];
        _dataLabel.text = @"选择日期";
        _dataLabel.textColor = [UIColor whiteColor];
        _dataLabel.adjustsFontSizeToFitWidth = YES;
        _dataLabel.font = [UIFont systemFontOfSize:50];
        
        _stuNumLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 260, 90, 70)];
        _stuNumLabel.text = @"班级编号";
        _stuNumLabel.textColor = [UIColor whiteColor];
        _stuNumLabel.adjustsFontSizeToFitWidth = YES;
        _stuNumLabel.font = [UIFont systemFontOfSize:50];
        
        _stuPwdLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 350, 90, 70)];
        _stuPwdLabel.text = @"允许补签";
        _stuPwdLabel.textColor = [UIColor whiteColor];
        _stuPwdLabel.adjustsFontSizeToFitWidth = YES;
        _stuPwdLabel.font = [UIFont systemFontOfSize:50];
        
        _stuTypeLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 440, 90, 70)];
        _stuTypeLabel.text = @"倒计时间";
        _stuTypeLabel.textColor = [UIColor whiteColor];
        _stuTypeLabel.adjustsFontSizeToFitWidth = YES;
        _stuTypeLabel.font = [UIFont systemFontOfSize:50];
        
        _courseNumLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 520, 90, 70)];
        _courseNumLabel.text = @"第几节课";
        _courseNumLabel.textColor = [UIColor whiteColor];
        _courseNumLabel.adjustsFontSizeToFitWidth = YES;
        _courseNumLabel.font = [UIFont systemFontOfSize:50];
        
        _logInLabel = [[UILabel alloc]initWithFrame:CGRectMake(160, 645, 130, 80)];
        _logInLabel.text = @"发布";
        _logInLabel.font = [UIFont systemFontOfSize:55];
        _logInLabel.textColor = [UIColor redColor];
        
        _qrCodeLabel = [[UILabel alloc]initWithFrame:CGRectMake(155, 745, 190, 80)];
        _qrCodeLabel.text = @"生成二维码";
        _qrCodeLabel.font = [UIFont systemFontOfSize:25];
        _qrCodeLabel.textColor = [UIColor blackColor];
        
        _getStuNumField = [[UITextField alloc]initWithFrame:CGRectMake(150, 270, 230, 60)];
        _getStuNumField.borderStyle = UITextBorderStyleRoundedRect;
        _getStuNumField.backgroundColor = [UIColor whiteColor];
        _getStuNumField.placeholder = @"点击输入";
        _getStuNumField.clearButtonMode = UITextFieldViewModeAlways;
        _getStuNumField.font = [UIFont systemFontOfSize:30];
        _getStuNumField.clearsOnBeginEditing = YES;
        _getStuNumField.keyboardType = UIKeyboardTypeNumberPad;
        [_getStuNumField addTarget:self action:@selector(stuNumTextFieldDidChange:) forControlEvents:(UIControlEventEditingChanged)];
        
        
        _getStuPwdField = [[UITextField alloc]initWithFrame:CGRectMake(150, 360, 230, 60)];
        _getStuPwdField.borderStyle = UITextBorderStyleRoundedRect;
        _getStuPwdField.backgroundColor = [UIColor whiteColor];
        _getStuPwdField.placeholder = @"Y/N";
        _getStuPwdField.font = [UIFont systemFontOfSize:30];
        _getStuPwdField.clearsOnBeginEditing = YES;
        _getStuPwdField.secureTextEntry = YES;
        _getStuPwdField.keyboardType = UIKeyboardTypeDefault;
        [_getStuPwdField addTarget:self action:@selector(stuPwdTextFieldDidChange:) forControlEvents:(UIControlEventEditingChanged)];

        
        _getStuTypeField = [[UITextField alloc]initWithFrame:CGRectMake(150, 450, 230, 60)];
        _getStuTypeField.borderStyle = UITextBorderStyleRoundedRect;
        _getStuTypeField.backgroundColor = [UIColor whiteColor];
        _getStuTypeField.clearButtonMode = UITextFieldViewModeAlways;
        _getStuTypeField.font = [UIFont systemFontOfSize:30];
        _getStuTypeField.clearsOnBeginEditing = YES;
        _getStuTypeField.placeholder = @"min";
        _getStuTypeField.keyboardType = UIKeyboardTypeDefault;
        [_getStuTypeField addTarget:self action:@selector(stuTypeTextFieldDidChange:) forControlEvents:(UIControlEventEditingChanged)];


        _getCourseNumField = [[UITextField alloc]initWithFrame:CGRectMake(150, 530, 230, 60)];
        _getCourseNumField.borderStyle = UITextBorderStyleRoundedRect;
        _getCourseNumField.backgroundColor = [UIColor whiteColor];
        _getCourseNumField.placeholder = @"点击输入";
        _getCourseNumField.clearButtonMode = UITextFieldViewModeAlways;
        _getCourseNumField.font = [UIFont systemFontOfSize:30];
        _getCourseNumField.clearsOnBeginEditing = YES;
        _getCourseNumField.keyboardType = UIKeyboardTypeNumberPad;
        [_getCourseNumField addTarget:self action:@selector(stuNumTextFieldDidChange:) forControlEvents:(UIControlEventEditingChanged)];
        
        _getDataField = [[UITextField alloc]initWithFrame:CGRectMake(150, 170, 230, 60)];
        _getDataField.borderStyle = UITextBorderStyleRoundedRect;
        _getDataField.backgroundColor = [UIColor whiteColor];
        _getDataField.placeholder = @"举例：2.12";
        _getDataField.clearButtonMode = UITextFieldViewModeAlways;
        _getDataField.font = [UIFont systemFontOfSize:30];
        _getDataField.clearsOnBeginEditing = YES;
        _getDataField.keyboardType = UIKeyboardTypeNumberPad;
        [_getDataField addTarget:self action:@selector(stuNumTextFieldDidChange:) forControlEvents:(UIControlEventEditingChanged)];
        
        [_logInContainerView addSubview:_getStuNumField];
        [_logInContainerView addSubview:_getStuPwdField];
        [_logInContainerView addSubview:_getStuTypeField];
        [_logInContainerView addSubview:_logInLabel];
        [_logInContainerView addSubview:_stuPwdLabel];
        [_logInContainerView addSubview:_stuTypeLabel];
        [_logInContainerView addSubview:_stuNumLabel];
        [_logInContainerView addSubview:_courseNumLabel];
        [_logInContainerView addSubview:_getCourseNumField];
        [_logInContainerView addSubview:_dataLabel];
        [_logInContainerView addSubview:_getDataField];
        [_logInContainerView addSubview:_qrCodeLabel];

    }
    return _logInContainerView;
}


@end
