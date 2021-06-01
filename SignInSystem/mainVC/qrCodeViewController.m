//
//  qrCodeViewController.m
//  SignInSystem
//
//  Created by bytedance on 2021/5/18.
//

#import "qrCodeViewController.h"
#import "QiCodeManager.h"

@interface qrCodeViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *codeImageView;


@end

@implementation qrCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(25, 200, self.view.frame.size.width-50, self.view.frame.size.width-50)];
    view.backgroundColor = [UIColor blackColor];
    NSString *code = @"123";
    CGSize size = _codeImageView.bounds.size;
    UIImage *codeImage = [QiCodeManager generateQRCode:code size:size];
    view.image = [UIImage imageNamed:@"qrCode.png"];
    [self.view addSubview:view];
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
