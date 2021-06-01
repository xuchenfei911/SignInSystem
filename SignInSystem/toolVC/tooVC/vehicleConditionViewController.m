//
//  vehicleConditionViewController.m
//  signIn
//
//  Created by xuchenfei on 2021/4/13.
//

#import "vehicleConditionViewController.h"

@interface vehicleConditionViewController ()

@end

@implementation vehicleConditionViewController

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

    
    
    UITableView *VehiclConditionTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.height/9)-10, self.view.bounds.size.width, (self.view.bounds.size.height))];

    VehiclConditionTableView.dataSource = self;
    VehiclConditionTableView.delegate = self;
    
    self.listLoad5 = [[Loader1 alloc]init];
    [self.listLoad5 loadListData5];
    //NSArray *text3 = [[NSArray alloc]init];
    
    self.listLoad5.block5 = ^(NSArray * text5) {
        
        //self.listMode2 = text2;
        self.arrayMode5 = text5;
        
       NSLog(@"------------------------!");

        //NSLog(@"-------%@",self.listMode2.co);
        [VehiclConditionTableView reloadData];
    };

  
    
    [self.view addSubview:VehiclConditionTableView];



}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 11;
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
        cell.textLabel.text = [NSString stringWithFormat:@"日期:%@",self.arrayMode5[10].data];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"限行信息%@",self.arrayMode5[10].prompt];
        // cell.textLabel.textColor = [UIColor grayColor];



    }else if(indexPath.row == 1)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"日期:%@",self.arrayMode5[9].data];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"限行信息:%@",self.arrayMode5[9].prompt];
       // cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode2.rank];
        // cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _listMode1.condition];;

    }else if(indexPath.row == 2)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"日期:%@",self.arrayMode5[8].data];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"限行信息:%@",self.arrayMode5[8].prompt];
        //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode2.pm25];
        // cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _listMode1.shidu];;

    }else if(indexPath.row == 3)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"日期:%@",self.arrayMode5[7].data];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"限行信息:%@",self.arrayMode5[7].prompt];
        //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode2.pm10];
        //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _listMode1.qiya];;

    }else if(indexPath.row == 4)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"日期:%@",self.arrayMode5[6].data];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"限行信息:%@",self.arrayMode5[6].prompt];
        //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode2.so2];
        //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _listMode1.fengxiang];;

    }else if(indexPath.row == 5)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"日期:%@",self.arrayMode5[5].data];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"限行信息:%@",self.arrayMode5[5].prompt];
       // cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode2.no2];
        //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _listMode1.fengli];;

    }else if(indexPath.row == 6)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"日期:%@",self.arrayMode5[4].data];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"限行信息:%@",self.arrayMode5[4].prompt];
        //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode2.o3];
        //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _listMode1.fengsu];

    }else if(indexPath.row == 7)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"日期:%@",self.arrayMode5[3].data];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"限行信息:%@",self.arrayMode5[3].prompt];
       // cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode2.co];

        // cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode1.tishi];

    }else if(indexPath.row == 8)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"日期:%@",self.arrayMode5[2].data];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"限行信息:%@",self.arrayMode5[2].prompt];
       // cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode2.no2];
        //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _listMode1.fengli];;

    }else if(indexPath.row == 9)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"日期:%@",self.arrayMode5[1].data];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"限行信息:%@",self.arrayMode5[1].prompt];
        //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode2.o3];
        //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _listMode1.fengsu];

    }else if(indexPath.row == 10)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"日期:%@",self.arrayMode5[0].data];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"限行信息:%@",self.arrayMode5[0].prompt];
       // cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode2.co];

        // cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode1.tishi];

    }



    return cell;
}



@end

