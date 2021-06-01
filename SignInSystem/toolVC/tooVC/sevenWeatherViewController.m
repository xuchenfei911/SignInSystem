//
//  sevenWeatherViewController.m
//  signIn
//
//  Created by xuchenfei on 2021/4/13.
//

#import "sevenWeatherViewController.h"

@interface sevenWeatherViewController ()

@end

@implementation sevenWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];

    UILabel *titleView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height/9)];
    titleView.backgroundColor  = [UIColor whiteColor];
    [self.view addSubview:titleView];
    //字体字号，格式设置
    titleView.textAlignment = NSTextAlignmentCenter;
    [titleView setText:@"北京"];
    UIFont *lb = [UIFont systemFontOfSize:26];
    [titleView setFont:lb];


    UITableView *recentWeatherTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.height/9)-10, self.view.bounds.size.width, (self.view.bounds.size.height))];

    recentWeatherTableView.dataSource = self;
    recentWeatherTableView.delegate = self;

    self.listLoad3 = [[Loader1 alloc]init];
    [self.listLoad3 loadListData3];
    //NSArray *text3 = [[NSArray alloc]init];
    self.listLoad3.block3 = ^(NSArray * text3) {
        
        //self.listMode2 = text2;
        self.arrayMode3 = text3;
        
       NSLog(@"------------------------!");

        //NSLog(@"-------%@",self.listMode2.co);
        [recentWeatherTableView reloadData];
    };
    
    [self.view addSubview:recentWeatherTableView];


}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 8;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return ((self.view.bounds.size.height-self.view.bounds.size.height/9))/6.5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"id"];
    }


    if(indexPath.row == 0)
    {
        //NSString *nowTime = [self getCurrentTime];
        cell.textLabel.text = [NSString stringWithFormat:@"day:%@",self.arrayMode3[5].predictDate];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"最高温：%@ 最低温：%@",self.arrayMode3[5].tempDay,self.arrayMode3[5].tempNight];
        cell.imageView.image = [UIImage imageNamed:@"w3.png"];

        // cell.textLabel.textColor = [UIColor grayColor];



    }else if(indexPath.row == 1)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"day:%@",self.arrayMode3[4].predictDate];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"最高温：%@ 最低温：%@",self.arrayMode3[4].tempDay,self.arrayMode3[4].tempNight];
        cell.imageView.image = [UIImage imageNamed:@"w3.png"];

        // cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode2.rank];
        // cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _listMode1.condition];;

    }else if(indexPath.row == 2)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"day:%@",self.arrayMode3[3].predictDate];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"最高温：%@ 最低温：%@",self.arrayMode3[3].tempDay,self.arrayMode3[3].tempNight];
        cell.imageView.image = [UIImage imageNamed:@"w1.png"];

        //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode2.pm25];
        // cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _listMode1.shidu];;

    }else if(indexPath.row == 3)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"day:%@",self.arrayMode3[2].predictDate];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"最高温：%@ 最低温：%@",self.arrayMode3[2].tempDay,self.arrayMode3[2].tempNight];
        cell.imageView.image = [UIImage imageNamed:@"w0.png"];

        //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode2.pm10];
        //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _listMode1.qiya];;

    }else if(indexPath.row == 4)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"day:%@",self.arrayMode3[1].predictDate];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"最高温：%@ 最低温：%@",self.arrayMode3[1].tempDay,self.arrayMode3[1].tempNight];
        cell.imageView.image = [UIImage imageNamed:@"w3.png"];

        //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode2.so2];
        //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _listMode1.fengxiang];;

    }else if(indexPath.row == 5)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"day:%@",self.arrayMode3[0].predictDate];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"最高温：%@ 最低温：%@",self.arrayMode3[0].tempDay,self.arrayMode3[0].tempNight];
        cell.imageView.image = [UIImage imageNamed:@"w3.png"];

        // cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode2.no2];
        //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _listMode1.fengli];;

    }


    return cell;
}


@end

