//
//  messageTableViewController.m
//  signIn
//
//  Created by xuchenfei on 2021/4/6.
//

#import "messageTableViewController.h"
#import "newsTableViewController.h"
#import "newsTableViewCell.h"
#import "newsDetailViewController.h"
#import "messageTableViewCell.h"
@interface messageTableViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation messageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
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
    
    newsDetailViewController *controller = [[newsDetailViewController alloc]init];
    controller.title = [NSString stringWithFormat:@"新闻精选"];
    controller.view.backgroundColor = [UIColor whiteColor];
    NSArray *urlArray = @[@"https://www.toutiao.com/w/a1699512555319310/?log_from=101efc2cf3828_162078718293",
                         @"http://m2.people.cn/news/toutiao.html?s=MV8wXzE0OTg3MTA2XzQwOTZfMTYyMDc3MjIxMw==&tt_group_id=6961165118461870628",
                         @"https://www.toutiao.com/a6960074991094350376/?log_from=76cccc96a5cc5_1620788036947",
                         @"https://www.toutiao.com/w/a1699515134695427/?log_from=f2689ddaf9072_1620788058305",
                         @"https://www.toutiao.com/a6960193803072389672/?log_from=1441953f6f40a_1620788066788",
                         @"https://www.toutiao.com/w/a1699449483727885/?log_from=f510ce230cbf1_1620788075903",
                         @"https://www.toutiao.com/a6960474863563719206/?log_from=824e41eabaf92_1620788604861",
                         @"http://m2.people.cn/news/toutiao.html?s=MV8wXzE0OTg3MDk4XzQwOTdfMTYyMDc3MjIxMg==&tt_group_id=6961165118566564389"
                         ];
    NSURL *url = [NSURL URLWithString:urlArray[indexPath.row]];
    [controller setUrlWithNSUrl:url];
    [self.navigationController pushViewController:controller animated:YES];
    
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    messageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell){
        cell = [[messageTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    if (indexPath.row == 0){
        [cell setTextWithString:@"关于开放西区七公寓旁铁门出行时间"];
        return cell;
    }else if (indexPath.row == 1) {
        [cell setTextWithString:@"关于2018级秋季补考通知"];
        return cell;
    }else if (indexPath.row == 2) {
        [cell setTextWithString:@"关于澡堂12.7停水通知"];
        return cell;
    }
    
    return  cell;
}



@end
