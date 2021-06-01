#import "currentTaskViewController.h"
#import "newsTableViewController.h"
#import "newsTableViewCell.h"
#import "newsDetailViewController.h"
#import "currentTaskTableViewCell.h"
#import "JSToastDialogs.h"
#import "applyForViewController.h"
#import "applyForTableViewCell.h"
@interface applyForViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation applyForViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.title = @"点击进行补签";
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
    
    [[JSToastDialogs shareInstance] makeToast:@"补签成功" duration:1.0];
    
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    applyForTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell){
        cell = [[applyForTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    NSArray *titleArray = @[@"5月13日，第3节大课，请签到",
                            @"5月13日，第4节大课，请签到",
                            @"5月13日，第5节大课，请签到"
    ];
    NSArray *sourceArray = @[@"满志强老师",
                            @"李想老师",
                            @"齐汉民老师"
    ];
    NSArray *commentArray = @[@"允许补签",
                            @"允许补签",
                            @"不允许补签"
    ];
    NSArray *timeArray = @[@"已过期",
                            @"已过期",
                            @"已过期"
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
        return cell;
    }
    [cell layoutTableViewCellWithTitle:titleArray[indexPath.row] andWithSource:sourceArray[indexPath.row] andWithComment:commentArray[indexPath.row] andWithTime:timeArray[indexPath.row] andWithPictureString:pictureArray[indexPath.row]];
    
    return  cell;
}



@end



