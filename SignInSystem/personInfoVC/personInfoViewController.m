//
//  personInfoViewController.m
//  signIn
//
//  Created by xuchenfei on 2021/4/6.
//

#import "personInfoViewController.h"
#import "JSToastDialogs.h"

@interface personInfoViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (strong,nonatomic) UIView *topView;
@property (strong,nonatomic) UIImageView *topCoverView;
@property (strong,nonatomic) UIImageView *myHeadPortraitView;
@property (strong,nonatomic) UILabel *headPortraitViewReminderLabel;

@property (strong,nonatomic) UIView *nameContainerView;
@property (strong,nonatomic) UIView *schoolContainerView;
@property (strong,nonatomic) UIView *jobContainerView;
@property (strong,nonatomic) UIView *gradeContainerView;

@property (strong,nonatomic) UIImageView *nameView;
@property (strong,nonatomic) UIImageView *schoolView;
@property (strong,nonatomic) UIImageView *jobView;
@property (strong,nonatomic) UIImageView *gradeView;

@property (strong,nonatomic) UILabel *nameViewLabel;
@property (strong,nonatomic) UILabel *schoolViewLabel;
@property (strong,nonatomic) UILabel *jobViewLabel;
@property (strong,nonatomic) UILabel *gradeViewLabel;

//登陆container
@property (strong,nonatomic) UIImageView *hrbustImage;
@property (strong,nonatomic) UIView *logInContainerView;
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
//信息展示框
@property (strong,nonatomic) UILabel *nameLabel;
@property (strong,nonatomic) UILabel *schoolLabel;
@property (strong,nonatomic) UILabel *jobLabel;
@property (strong,nonatomic) UILabel *gradeLabel;


@property (strong,nonatomic) UILabel *quiteLabel;




@end

@implementation personInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isNetOn = NO;
    self.tabBarItem.title = @"我的";
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBarItem.image = [[UIImage imageNamed:@"person1.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem.selectedImage = [[UIImage imageNamed:@"person2.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [self.view addSubview:self.topView];
    [self.view addSubview:self.topCoverView];
    [self.view addSubview:self.myHeadPortraitView];
    [self.view addSubview:self.headPortraitViewReminderLabel];
    
    [self.view addSubview:self.nameContainerView];
    [self.view addSubview:self.schoolContainerView];
    [self.view addSubview:self.jobContainerView];
    [self.view addSubview:self.gradeContainerView];

    [self.view addSubview:self.nameView];
    [self.view addSubview:self.schoolView];
    [self.view addSubview:self.jobView];
    [self.view addSubview:self.gradeView];
    
    [self.view addSubview:self.nameViewLabel];
    [self.view addSubview:self.schoolViewLabel];
    [self.view addSubview:self.jobViewLabel];
    [self.view addSubview:self.gradeViewLabel];
    
    [self.view addSubview:self.nameLabel];
    [self.view addSubview:self.schoolLabel];
    [self.view addSubview:self.jobLabel];
    [self.view addSubview:self.gradeLabel];
    
    [self.view addSubview:self.logInContainerView];
    
    [self.view addSubview:self.quiteLabel];
    
    [self addTapGestureToQuiteLabelView];
    [self addTapGestureToLogInLabelView];
    [self setHeadPortraitView];
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeNetStatus:) name:@"netMessage" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeLogStatus:) name:@"logInMessage" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeLogOutStatus:) name:@"logOutMessage" object:nil];

    
}

#pragma  setSubviews

- (void) setHeadPortraitView {
    self.myHeadPortraitView.layer.cornerRadius = self.myHeadPortraitView.frame.size.width / 2;
    self.myHeadPortraitView.layer.masksToBounds = YES;
    self.myHeadPortraitView.layer.borderWidth = 1.5f;
    self.myHeadPortraitView.layer.borderColor = [UIColor whiteColor].CGColor;
    
    _myHeadPortraitView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(alterHeadProtrait:)];
    [_myHeadPortraitView addGestureRecognizer:singleTap];
}
#pragma addTapGestureRecognizer

- (void) addTapGestureToQuiteLabelView {
    UIGestureRecognizer *singelTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(quiteAction)]; self.quiteLabel.userInteractionEnabled = YES;
    [_quiteLabel addGestureRecognizer:singelTap];
}

- (void) addTapGestureToLogInLabelView {
    UIGestureRecognizer *singelTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(logInAction)]; self.logInLabel.userInteractionEnabled = YES;
    [_logInLabel addGestureRecognizer:singelTap];
}

#pragma  action

- (void) alterHeadProtrait : (UIGestureRecognizer *)getture{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        [alert addAction:[UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            UIImagePickerController *PickerImage = [[UIImagePickerController alloc]init];
            PickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            PickerImage.allowsEditing = YES;
            PickerImage.delegate = self;
            [self presentViewController:PickerImage animated:YES completion:nil];
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
            UIImagePickerController *PickerImage = [[UIImagePickerController alloc]init];
            PickerImage.sourceType = UIImagePickerControllerSourceTypeCamera;
            PickerImage.allowsEditing = YES;
            PickerImage.delegate = self;
            [self presentViewController:PickerImage animated:YES completion:nil];
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
}

- (void) quiteAction{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"确认退出" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        self.myHeadPortraitView.image = [UIImage imageNamed:@"defaultAvatar.png"] ;
        self.logInContainerView.hidden = NO;
        self.topView.hidden = YES;
        self.topCoverView.hidden = YES;
        self.myHeadPortraitView.hidden = YES;
        self.headPortraitViewReminderLabel.hidden = YES;
        self.nameContainerView.hidden = YES;
        self.schoolContainerView.hidden = YES;
        self.jobContainerView.hidden = YES;
        self.gradeContainerView.hidden = YES;
        self.nameView.hidden = YES;
        self.schoolView.hidden = YES;
        self.jobView.hidden = YES;
        self.gradeView.hidden = YES;
        self.nameViewLabel.hidden = YES;
        self.schoolViewLabel.hidden = YES;
        self.jobViewLabel.hidden = YES;
        self.gradeViewLabel.hidden = YES;
        self.nameLabel.hidden = YES;
        self.schoolLabel.hidden = YES;
        self.jobLabel.hidden = YES;
        self.gradeLabel.hidden = YES;
        self.quiteLabel.hidden = YES;
        self.getStuTypeField.text = NULL;
        self.getStuPwdField.text = NULL;
        self.getStuTypeField.text = NULL;
        self.stuNum = NULL;
        self.stuPwd = NULL;
        self.stuType = NULL;
        self.isLogIn = NO;
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"logOutMessage" object:@""];

}

- (void) logInAction {
    if (!self.isNetOn) {
        [[JSToastDialogs shareInstance] makeToast:@"网络数据模拟未开启" duration:1.0];
        return ;
    }
    if ([self.stuPwd isEqualToString:@"a"]) {
        [[JSToastDialogs shareInstance] makeToast:@"登陆成功！" duration:1.0];
        self.logInContainerView.hidden = YES;
        self.topView.hidden = NO;
        self.topCoverView.hidden = NO;
        self.myHeadPortraitView.hidden = NO;
        self.headPortraitViewReminderLabel.hidden = NO;
        self.nameContainerView.hidden = NO;
        self.schoolContainerView.hidden = NO;
        self.jobContainerView.hidden = NO;
        self.gradeContainerView.hidden = NO;
        self.nameView.hidden = NO;
        self.schoolView.hidden = NO;
        self.jobView.hidden = NO;
        self.gradeView.hidden = NO;
        self.nameViewLabel.hidden = NO;
        self.schoolViewLabel.hidden = NO;
        self.jobViewLabel.hidden = NO;
        self.gradeViewLabel.hidden = NO;
        self.nameLabel.hidden = NO;
        self.schoolLabel.hidden = NO;
        self.jobLabel.hidden = NO;
        self.gradeLabel.hidden = NO;
        self.quiteLabel.hidden = NO;
        self.isLogIn = YES;
    }else {
        [[JSToastDialogs shareInstance] makeToast:@"登陆失败，请重新输入" duration:1.0];
    }
    

    [[NSNotificationCenter defaultCenter]postNotificationName:@"logInMessage" object:@""];
    
}
# pragma textfileAction
- (void) stuNumTextFieldDidChange:(UITextField*) sender {
    _stuNum = sender.text;
}

- (void) stuPwdTextFieldDidChange:(UITextField*) sender {
    _stuPwd = sender.text;
}

- (void) stuTypeTextFieldDidChange:(UITextField*) sender {
    _stuType = sender.text;
}

-(void)changeNetStatus:(NSNotification *)notification {
    self.isNetOn = YES;
}

-(void)changeLogStatus:(NSNotification *)notification {
    self.isLogIn = YES;
}

-(void)changeLogOutStatus:(NSNotification *)notification {
    self.isLogIn = YES;
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *newPhoto = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    _myHeadPortraitView.image = newPhoto;
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma  delegate

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent *)event{

[self.view endEditing:YES]; //实现该方法是需要注意view需要是继承UIControl而来的

}

#pragma  lazy loading

- (UIView *)topView {
    if (!_topView) {
        _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 400)];
        _topView.backgroundColor = [UIColor blueColor];
    }
    _topView.hidden = YES;
    return _topView;
}

- (UIImageView *)topCoverView {
    if (!_topCoverView) {
        _topCoverView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 400)];
        _topCoverView.backgroundColor = [UIColor whiteColor];
        _topCoverView.image = [UIImage imageNamed:@"sea.jpg"] ;
        _topCoverView.clipsToBounds = YES;
        _topCoverView.contentMode = UIViewContentModeScaleAspectFill;
    }
    _topCoverView.hidden = YES;
    return _topCoverView;
}
- (UIImageView *)myHeadPortraitView {
    if (!_myHeadPortraitView) {
        _myHeadPortraitView = [[UIImageView alloc]initWithFrame:CGRectMake(110, 100, 200, 200)];
        _myHeadPortraitView.backgroundColor = [UIColor whiteColor];
        _myHeadPortraitView.image = [UIImage imageNamed:@"defaultAvatar.png"] ;
    }
    _myHeadPortraitView.hidden = YES;
    return _myHeadPortraitView;
}

- (UILabel *)headPortraitViewReminderLabel {
    if (!_headPortraitViewReminderLabel) {
        _headPortraitViewReminderLabel = [[UILabel alloc]initWithFrame:CGRectMake(125, 230, 300, 200)];
        _headPortraitViewReminderLabel.backgroundColor = [UIColor clearColor];
        _headPortraitViewReminderLabel.adjustsFontSizeToFitWidth = YES;
        _headPortraitViewReminderLabel.font = [UIFont systemFontOfSize:16];
        _headPortraitViewReminderLabel.text = @"设置头像，让你更有范儿";
        _headPortraitViewReminderLabel.textColor = [UIColor blueColor];
    }
    _headPortraitViewReminderLabel.hidden = YES;
    return _headPortraitViewReminderLabel;
}

//containerView
//姓名
- (UIView *)nameContainerView {
    if (!_nameContainerView) {
        _nameContainerView = [[UIView alloc]initWithFrame:CGRectMake(0, 400, self.view.frame.size.width, 70)];
        _nameContainerView.backgroundColor = [UIColor whiteColor];
    }
    _nameContainerView.hidden = YES;
    return _nameContainerView;
}

- (UIImageView *)nameView {
    if (!_nameView) {
        _nameView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 420, 40, 40)];
        _nameView.image = [UIImage imageNamed:@"name.png"];
    }
    _nameView.hidden = YES;
    return _nameView;
}

- (UILabel *)nameViewLabel {
    if (!_nameViewLabel) {
        _nameViewLabel = [[UILabel alloc]initWithFrame:CGRectMake(90, 415, 50, 50)];
        _nameViewLabel.text = @"姓名";
        _nameViewLabel.font = [UIFont systemFontOfSize:20];
        _nameViewLabel.textColor = [UIColor blackColor];
    }
    _nameViewLabel.hidden = YES;
    return _nameViewLabel;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(290, 415, 150, 50)];
        _nameLabel.text = @"许陈飞";
        _nameLabel.font = [UIFont systemFontOfSize:20];
        _nameLabel.textColor = [UIColor blackColor];
    }
    _nameLabel.hidden = YES;
    return _nameLabel;
}


//学校
- (UIView *)schoolContainerView {
    if (!_schoolContainerView) {
        _schoolContainerView = [[UIView alloc]initWithFrame:CGRectMake(0, 470, self.view.frame.size.width, 70)];
        _schoolContainerView.backgroundColor = [UIColor whiteColor];
    }
    _schoolContainerView.hidden = YES;
    return _schoolContainerView;
}

- (UIImageView *)schoolView {
    if (!_schoolView) {
        _schoolView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 490, 40, 40)];
        _schoolView.image = [UIImage imageNamed:@"school.png"];
    }
    _schoolView.hidden = YES;
    return _schoolView;
}

- (UILabel *)schoolViewLabel {
    if (!_schoolViewLabel) {
        _schoolViewLabel = [[UILabel alloc]initWithFrame:CGRectMake(90, 485, 50, 50)];
        _schoolViewLabel.text = @"学校";
        _schoolViewLabel.font = [UIFont systemFontOfSize:20];
        _schoolViewLabel.textColor = [UIColor blackColor];
    }
    _schoolViewLabel.hidden = YES;
    return _schoolViewLabel;
}

- (UILabel *)schoolLabel {
    if (!_schoolLabel) {
        _schoolLabel = [[UILabel alloc]initWithFrame:CGRectMake(260, 485, 180, 50)];
        _schoolLabel.text = @"哈尔滨理工大学";
        _schoolLabel.font = [UIFont systemFontOfSize:20];
        _schoolLabel.textColor = [UIColor blackColor];
    }
    _schoolLabel.hidden = YES;
    return _schoolLabel;
}



//职业
- (UIView *)jobContainerView {
    if (!_jobContainerView) {
        _jobContainerView = [[UIView alloc]initWithFrame:CGRectMake(0, 540, self.view.frame.size.width, 70)];
        _jobContainerView.backgroundColor = [UIColor whiteColor];
    }
    _jobContainerView.hidden = YES;
    return _jobContainerView;
}

- (UIImageView *)jobView {
    if (!_jobView) {
        _jobView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 560, 40, 40)];
        _jobView.image = [UIImage imageNamed:@"job.png"];
    }
    _jobView.hidden = YES;
    return _jobView;
}

- (UILabel *)jobViewLabel {
    if (!_jobViewLabel) {
        _jobViewLabel = [[UILabel alloc]initWithFrame:CGRectMake(90, 555, 50, 50)];
        _jobViewLabel.text = @"职业";
        _jobViewLabel.font = [UIFont systemFontOfSize:20];
        _jobViewLabel.textColor = [UIColor blackColor];
    }
    _jobViewLabel.hidden = YES;
    return _jobViewLabel;
}

- (UILabel *)jobLabel {
    if (!_jobLabel) {
        _jobLabel = [[UILabel alloc]initWithFrame:CGRectMake(300, 555, 150, 50)];
        _jobLabel.text = @"学生";
        _jobLabel.font = [UIFont systemFontOfSize:20];
        _jobLabel.textColor = [UIColor blackColor];
    }
    _jobLabel.hidden = YES;
    return _jobLabel;
}

//年级

- (UIView *)gradeContainerView {
    if (!_gradeContainerView) {
        _gradeContainerView = [[UIView alloc]initWithFrame:CGRectMake(0, 610, self.view.frame.size.width, 70)];
        _gradeContainerView.backgroundColor = [UIColor whiteColor];
    }
    _gradeContainerView.hidden = YES;
    return _gradeContainerView;
}

- (UIImageView *)gradeView {
    if (!_gradeView) {
        _gradeView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 630, 40, 40)];
        _gradeView.image = [UIImage imageNamed:@"grade.png"];
    }
    _gradeView.hidden = YES;
    return _gradeView;
}

- (UILabel *)gradeViewLabel {
    if (!_gradeViewLabel) {
        _gradeViewLabel = [[UILabel alloc]initWithFrame:CGRectMake(90, 625, 50, 50)];
        _gradeViewLabel.text = @"年级";
        _gradeViewLabel.font = [UIFont systemFontOfSize:20];
        _gradeViewLabel.textColor = [UIColor blackColor];
    }
    _gradeViewLabel.hidden = YES;
    return _gradeViewLabel;
}

- (UILabel *)gradeLabel {
    if (!_gradeLabel) {
        _gradeLabel = [[UILabel alloc]initWithFrame:CGRectMake(300, 625, 150, 50)];
        _gradeLabel.text = @"大四";
        _gradeLabel.font = [UIFont systemFontOfSize:20];
        _gradeLabel.textColor = [UIColor blackColor];
    }
    _gradeLabel.hidden = YES;
    return _gradeLabel;
}

//退出按钮
- (UILabel *)quiteLabel {
    if (!_quiteLabel) {
        _quiteLabel = [[UILabel alloc]initWithFrame:CGRectMake(160, 695, 160, 80)];
        _quiteLabel.backgroundColor = [UIColor whiteColor];
        _quiteLabel.text = @"退出登陆";
        _quiteLabel.font = [UIFont systemFontOfSize:25];
        _quiteLabel.textColor = [UIColor grayColor];
    }
    _quiteLabel.hidden = YES;
    return _quiteLabel;
}

//登陆界面
- (UIView *)logInContainerView {
    if (!_logInContainerView) {
        _logInContainerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size
                                                                      .height)];
        _logInContainerView.backgroundColor = [UIColor whiteColor];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        imageView.image = [UIImage imageNamed:@"bluebg.jpg"];
        [_logInContainerView addSubview:imageView];
        
        _hrbustImage = [[UIImageView alloc]initWithFrame:CGRectMake(80, 50, 270, 270)];
        _hrbustImage.image = [UIImage imageNamed:@"hrbust.png"];
        
        _stuNumLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 360, 80, 60)];
        _stuNumLabel.text = @"学号";
        _stuNumLabel.adjustsFontSizeToFitWidth = YES;
        _stuNumLabel.font = [UIFont systemFontOfSize:50];
        
        _stuPwdLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 450, 80, 60)];
        _stuPwdLabel.text = @"密码";
        _stuPwdLabel.adjustsFontSizeToFitWidth = YES;
        _stuPwdLabel.font = [UIFont systemFontOfSize:50];
        
        _stuTypeLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 540, 80, 60)];
        _stuTypeLabel.text = @"类型";
        _stuTypeLabel.adjustsFontSizeToFitWidth = YES;
        _stuTypeLabel.font = [UIFont systemFontOfSize:50];
        
        _logInLabel = [[UILabel alloc]initWithFrame:CGRectMake(160, 665, 130, 80)];
        _logInLabel.text = @"登陆";
        _logInLabel.font = [UIFont systemFontOfSize:55];
        _logInLabel.textColor = [UIColor redColor];
        
        _getStuNumField = [[UITextField alloc]initWithFrame:CGRectMake(170, 360, 230, 60)];
        _getStuNumField.borderStyle = UITextBorderStyleRoundedRect;
        _getStuNumField.backgroundColor = [UIColor whiteColor];
        _getStuNumField.placeholder = @"点击输入";
        _getStuNumField.clearButtonMode = UITextFieldViewModeAlways;
        _getStuNumField.font = [UIFont systemFontOfSize:30];
        _getStuNumField.clearsOnBeginEditing = YES;
        _getStuNumField.keyboardType = UIKeyboardTypeNumberPad;
        [_getStuNumField addTarget:self action:@selector(stuNumTextFieldDidChange:) forControlEvents:(UIControlEventEditingChanged)];
        
        
        _getStuPwdField = [[UITextField alloc]initWithFrame:CGRectMake(170, 450, 230, 60)];
        _getStuPwdField.borderStyle = UITextBorderStyleRoundedRect;
        _getStuPwdField.backgroundColor = [UIColor whiteColor];
        _getStuPwdField.placeholder = @"点击输入";
        _getStuPwdField.clearButtonMode = UITextFieldViewModeAlways;
        _getStuPwdField.font = [UIFont systemFontOfSize:30];
        _getStuPwdField.clearsOnBeginEditing = YES;
        _getStuPwdField.secureTextEntry = YES;
        _getStuPwdField.keyboardType = UIKeyboardTypeDefault;
        [_getStuPwdField addTarget:self action:@selector(stuPwdTextFieldDidChange:) forControlEvents:(UIControlEventEditingChanged)];

        
        _getStuTypeField = [[UITextField alloc]initWithFrame:CGRectMake(170, 540, 230, 60)];
        _getStuTypeField.borderStyle = UITextBorderStyleRoundedRect;
        _getStuTypeField.backgroundColor = [UIColor whiteColor];
        _getStuTypeField.clearButtonMode = UITextFieldViewModeAlways;
        _getStuTypeField.placeholder = @"学生S/老师T";
        _getStuTypeField.font = [UIFont systemFontOfSize:30];
        _getStuTypeField.clearsOnBeginEditing = YES;
        _getStuTypeField.keyboardType = UIKeyboardTypeDefault;
        [_getStuTypeField addTarget:self action:@selector(stuTypeTextFieldDidChange:) forControlEvents:(UIControlEventEditingChanged)];


        
        [_logInContainerView addSubview:_getStuNumField];
        [_logInContainerView addSubview:_getStuPwdField];
        [_logInContainerView addSubview:_getStuTypeField];
        [_logInContainerView addSubview:_hrbustImage];
        [_logInContainerView addSubview:_logInLabel];
        [_logInContainerView addSubview:_stuPwdLabel];
        [_logInContainerView addSubview:_stuTypeLabel];
        [_logInContainerView addSubview:_stuNumLabel];
    }
    return _logInContainerView;
}

@end
