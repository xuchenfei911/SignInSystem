//
//  currentTaskViewController.m
//  SignInSystem
//
//  Created by bytedance on 2021/5/12.
//

#import "currentTaskViewController.h"
#import "newsTableViewController.h"
#import "newsTableViewCell.h"
#import "newsDetailViewController.h"
#import "currentTaskTableViewCell.h"
#import "JSToastDialogs.h"
#import "studentApplyViewController.h"
#import "studentApplyTableViewCell.h"

@interface studentApplyViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong,readwrite) UIButton *agreeButton;
@property (nonatomic,strong,readwrite) UIButton *refuseButton;
@end

@implementation studentApplyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.title = @"补签申请详情";
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeNetStatus:) name:@"netMessage" object:nil];
    
    UITableView *newsTableView = [[UITableView alloc]initWithFrame:self.view.bounds];

    [self.view addSubview:newsTableView];
    newsTableView.dataSource = self;
    newsTableView.delegate = self;

}

#pragma action
- (void) changeNetStatus: (NSNotification *)notification {
    
}

#pragma  delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
   // [[JSToastDialogs shareInstance] makeToast:@"签到成功" duration:1.0];
    
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    studentApplyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell){
        cell = [[studentApplyTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    NSArray *titleArray = @[@"张三",
                            @"李四",
                            @"王五"
    ];
    NSArray *sourceArray = @[@"1704010324",
                             @"1704010327",
                             @"1704010323"
    ];
    NSArray *commentArray = @[@"5.22第四节大课",
                            @"5.23第四节大课",
                            @"5.22第四节大课"
    ];
    NSArray *timeArray = @[@"已过期3小时",
                            @"已过期3小时40分钟",
                            @"已过期1小时"
    ];
    NSArray *pictureArray = @[@"news1.jpg",
                            @"news3.png",
                            @"news7.png",
                            @"news9.png",
                            @"news2.jpg",
                            @"news4.png",
                            @"news6.png",
                            @"news6.png"
    ];
    if(indexPath.row>2) {
        [cell layoutTableViewCellWithTitle:@"" andWithSource:@"" andWithComment:@"" andWithTime:@"" andWithPictureString:pictureArray[0]];
        [cell setButtonHidden];
        return cell;
    }
    [cell layoutTableViewCellWithTitle:titleArray[indexPath.row] andWithSource:sourceArray[indexPath.row] andWithComment:commentArray[indexPath.row] andWithTime:timeArray[indexPath.row] andWithPictureString:pictureArray[indexPath.row]];
    
    
    return  cell;
}



@end



