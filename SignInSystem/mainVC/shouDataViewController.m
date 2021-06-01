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
#import "shouDataViewController.h"
#import "showDataTableViewCell.h"
#import "dataViewController.h"
@interface shouDataViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation shouDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.title = @"签到情况统计";
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
    
    dataViewController *controller = [[dataViewController alloc]init];

    [self.navigationController pushViewController:controller animated:YES];
    
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    showDataTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell){
        cell = [[showDataTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    NSArray *titleArray = @[@"5月13日，第3节大课",
                            @"5月13日，第4节大课",
                            @"5月13日，第5节大课",
                            @"5月12日，第3节大课",
                            @"5月12日，第1节大课",
                            @"5月12日，第6节大课"
    ];
    NSArray *sourceArray = @[@"10/30",
                            @"29/33",
                            @"29/30",
                            @"10/33",
                            @"25/33",
                            @"29/30"
    ];
    NSArray *commentArray = @[@"出勤率33%   点击查看未出勤名单",
                            @"出勤率87%   点击查看未出勤名单",
                            @"出勤率99%   点击查看未出勤名单",
                            @"出勤率31%   点击查看未出勤名单",
                            @"出勤率75%   点击查看未出勤名单",
                            @"出勤率99%   点击查看未出勤名单"
    ];
    NSArray *timeArray = @[@"剩余30分钟",
                            @"已过期",
                            @"已过期",
                           @"已过期",
                           @"已过期",
                           @"已过期",
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
    if(indexPath.row>5) {
        [cell layoutTableViewCellWithTitle:@"" andWithSource:@"" andWithComment:@"" andWithTime:@"" andWithPictureString:pictureArray[0]];
        return cell;
    }
    [cell layoutTableViewCellWithTitle:titleArray[indexPath.row] andWithSource:sourceArray[indexPath.row] andWithComment:commentArray[indexPath.row] andWithTime:timeArray[indexPath.row] andWithPictureString:pictureArray[indexPath.row]];
    
    return  cell;
}



@end



