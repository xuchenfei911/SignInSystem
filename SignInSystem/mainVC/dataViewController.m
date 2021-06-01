//
//  dataViewController.m
//  SignInSystem
//
//  Created by bytedance on 2021/5/12.
//

#import "dataViewController.h"
#import "currentTaskTableViewCell.h"

@interface dataViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation dataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *newsTableView = [[UITableView alloc]initWithFrame:self.view.bounds];

    [self.view addSubview:newsTableView];
    newsTableView.dataSource = self;
    newsTableView.delegate = self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    currentTaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell){
        cell = [[currentTaskTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    NSArray *titleArray = @[@"张强",
                            @"李四",
                            @"李三",
                            @"赵五"
    ];
    NSArray *sourceArray = @[@"计算机3班",
                             @"计算机3班",
                            @"计算机2班",
                            @"计算机4班",
    ];
    NSArray *commentArray = @[@"1704010324",
                            @"1704010325",
                            @"1704010328",
                            @"1704010329",
    ];
    NSArray *timeArray = @[@"",
                            @"",
                            @"",
                            @"",
                            @"",
                            @"",
                            @"",
                            @""
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
    if(indexPath.row>=4) {
        [cell layoutTableViewCellWithTitle:@"" andWithSource:@"" andWithComment:@"" andWithTime:@"" andWithPictureString:pictureArray[0]];
        return cell;
    }
    [cell layoutTableViewCellWithTitle:titleArray[indexPath.row] andWithSource:sourceArray[indexPath.row] andWithComment:commentArray[indexPath.row] andWithTime:timeArray[indexPath.row] andWithPictureString:pictureArray[indexPath.row]];
    
    return  cell;
}




@end
