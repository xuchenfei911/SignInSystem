//
//  newsTableViewController.m
//  signIn
//
//  Created by xuchenfei on 2021/4/6.
//

#import "newsTableViewController.h"
#import "newsTableViewCell.h"
#import "newsDetailViewController.h"

@interface newsTableViewController ()<UITableViewDataSource,UITableViewDelegate>



@end

@implementation newsTableViewController

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
    newsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell){
        cell = [[newsTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    NSArray *titleArray = @[@"#小米降噪耳机Pro#几个贴心的小功能，试用过后真心觉得好。冒死截屏，给大家提前曝光一下",
                            @"信息保护与差异化服务的平衡（经济透视）",
                            @"小米不值得购买的手机",
                            @"中国从来都不是美国的敌人，美国人自己才是。",
                            @"北汽蓝谷（华为自动驾驶）将成为科技股龙头",
                            @"第七次全国人口普查主要数据：全国人口共141178万人，男性人口为723",
                            @"新能源大时代，谁是大赢家？——光伏、锂电、氢能行业全解析",
                            @"智能电动汽车闪亮登场（产经观察）"
    ];
    NSArray *sourceArray = @[@"今日头条",
                            @"人民网",
                            @"数码博主小张",
                            @"中国青年网",
                            @"演成的茶座",
                            @"中国青年网",
                            @"经济日报",
                            @"光明网"
    ];
    NSArray *commentArray = @[@"10评论",
                            @"220评论",
                            @"5评论",
                            @"30评论",
                            @"45评论",
                            @"34评论",
                            @"98评论",
                            @"15评论"
    ];
    NSArray *timeArray = @[@"2天前",
                            @"1天前",
                            @"2小时前",
                            @"1天前",
                            @"4小时前",
                            @"7小时前",
                            @"2天前",
                            @"3小时前"
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
    if(indexPath.row>=7) {
        [cell layoutTableViewCellWithTitle:titleArray[0] andWithSource:sourceArray[0] andWithComment:commentArray[0] andWithTime:timeArray[0] andWithPictureString:pictureArray[0]];
        return cell;
    }
    [cell layoutTableViewCellWithTitle:titleArray[indexPath.row] andWithSource:sourceArray[indexPath.row] andWithComment:commentArray[indexPath.row] andWithTime:timeArray[indexPath.row] andWithPictureString:pictureArray[indexPath.row]];
    
    return  cell;
}



@end
