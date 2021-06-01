//
//  toolCabinetViewController.m
//  signIn
//
//  Created by xuchenfei on 2021/4/6.
//

#import "toolCabinetViewController.h"
#import "toolViewController.h"
#import "Loader1.h"
#import "JSToastDialogs.h"

@interface toolCabinetViewController ()

@property (nonatomic,strong) toolViewController* baseVC;


@end

@implementation toolCabinetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarItem.title = @"工具箱";
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBarItem.image = [[UIImage imageNamed:@"tool1.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tool2.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


#pragma lazyloading






/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
