//
//  ariQualityViewController.m
//  signIn
//
//  Created by xuchenfei on 2021/4/13.
//

#import "ariQualityViewController.h"

@interface ariQualityViewController ()

@end

@implementation ariQualityViewController

- (instancetype) init {
    self = [super init];
    if(self) {

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];

    
    //NSLog(@"------------------------!");

    UILabel *titleView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height/9)];
    titleView.backgroundColor  = [UIColor whiteColor];
    [self.view addSubview:titleView];
    //字体字号，格式设置
    titleView.textAlignment = NSTextAlignmentCenter;
    [titleView setText:@"北京"];
    UIFont *lb = [UIFont systemFontOfSize:26];
    [titleView setFont:lb];



    UITableView *airQualityTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.height/9)-10, self.view.bounds.size.width, (self.view.bounds.size.height))];


    

    airQualityTableView.dataSource = self;
    airQualityTableView.delegate = self;

    self.listMode2 = [[ListModel2 alloc]init];
    
    self.listLoad2 = [[Loader1 alloc]init];
    [self.listLoad2 loadListData2];


    
   // NSLog(@"------------------------!");

    self.listLoad2.block2 = ^(ListModel2 * text2) {
        
        self.listMode2 = text2;
        
        
       // NSLog(@"------------------------!");

        //NSLog(@"-------%@",self.listMode2.co);
        [airQualityTableView reloadData];
    };




    [self.view addSubview:airQualityTableView];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 8;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return ((self.view.bounds.size.height-self.view.bounds.size.height/9)-50)/8;
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
        cell.textLabel.text = [NSString stringWithFormat:@"空气质量指数"];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode2.qulityNum];
        // cell.textLabel.textColor = [UIColor grayColor];
        cell.imageView.image = [UIImage imageNamed:@"zhishu.png"];


    }else if(indexPath.row == 1)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"全国排名"];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode2.rank];
        // cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _listMode1.condition];;
        cell.imageView.image = [UIImage imageNamed:@"paiming.png"];

    }else if(indexPath.row == 2)
    {
        cell.textLabel.text = @"PM2.5";
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode2.pm25];
        cell.imageView.image = [UIImage imageNamed:@"pm25.png"];
        // cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _listMode1.shidu];;

    }else if(indexPath.row == 3)
    {
        cell.textLabel.text = @"PM10";
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode2.pm10];
        //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _listMode1.qiya];;
        cell.imageView.image = [UIImage imageNamed:@"pm10.png"];

    }else if(indexPath.row == 4)
    {
        cell.textLabel.text = @"SO₂";
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode2.so2];
        //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _listMode1.fengxiang];;
        cell.imageView.image = [UIImage imageNamed:@"so2.png"];

    }else if(indexPath.row == 5)
    {
        cell.textLabel.text = @"NO₂";
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode2.no2];
        //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _listMode1.fengli];;
        cell.imageView.image = [UIImage imageNamed:@"no2.png"];

    }else if(indexPath.row == 6)
    {
        cell.textLabel.text = @"O₃";
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode2.o3];
        cell.imageView.image = [UIImage imageNamed:@"o3.png"];

        //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _listMode1.fengsu];

    }else if(indexPath.row == 7)
    {
        cell.textLabel.text = @"CO";
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode2.co];
        cell.imageView.image = [UIImage imageNamed:@"co.png"];
        // cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode1.tishi];

    }


    return cell;
}


@end

