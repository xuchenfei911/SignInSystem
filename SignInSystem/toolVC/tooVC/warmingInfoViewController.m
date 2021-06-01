//
//  warmingInfoViewController.m
//  signIn
//
//  Created by xuchenfei on 2021/4/13.
//

#import "warmingInfoViewController.h"

@interface warmingInfoViewController ()

@end

@implementation warmingInfoViewController

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

    
    UITableView *warningInfoTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.height/9)-10, self.view.bounds.size.width, (self.view.bounds.size.height))];

    warningInfoTableView.dataSource = self;
    warningInfoTableView.delegate = self;

    self.listLoad4 = [[Loader1 alloc]init];
    [self.listLoad4 loadListData4];
    
    [self.view addSubview:warningInfoTableView];



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
        cell.textLabel.text = [NSString stringWithFormat:@"当前地区暂时没有预警信息"];
       // cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode2.qulityNum];
        // cell.textLabel.textColor = [UIColor grayColor];



    }else if(indexPath.row == 1)
    {
        //cell.textLabel.text = [NSString stringWithFormat:@"全国排名"];
       // cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode2.rank];
        // cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _listMode1.condition];;

    }else if(indexPath.row == 2)
    {
        //cell.textLabel.text = @"PM2.5";
        //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode2.pm25];
        // cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _listMode1.shidu];;

    }else if(indexPath.row == 3)
    {
        //cell.textLabel.text = @"PM10";
        //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode2.pm10];
        //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _listMode1.qiya];;

    }else if(indexPath.row == 4)
    {
        //cell.textLabel.text = @"SO₂";
        //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode2.so2];
        //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _listMode1.fengxiang];;

    }else if(indexPath.row == 5)
    {
        //cell.textLabel.text = @"NO₂";
       // cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode2.no2];
        //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _listMode1.fengli];;

    }else if(indexPath.row == 6)
    {
        //cell.textLabel.text = @"O₃";
        //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode2.o3];
        //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _listMode1.fengsu];

    }else if(indexPath.row == 7)
    {
       // cell.textLabel.text = @"CO";
       // cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode2.co];

        // cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode1.tishi];

    }


    return cell;
}


@end
