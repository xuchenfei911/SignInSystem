//
//  viewReal-timeWeather.m
//  Weathter Forecast
//
//  Created by XuChenFei on 2020/12/14.
//

#import "nowWeatherViewController.h"
#import "LocationButton.h"

@interface nowWeatherViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation nowWeatherViewController

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
    self.navigationItem.title = @"哈尔滨天气";

    // 地点按钮
//    UIButton *locationButtion = [[UIButton alloc]initWithFrame:CGRectMake(340, 23, 35, 35)];
//    locationButtion.backgroundColor = [UIColor blueColor];
//    //[locationButtion setImage:[UIImage imageNamed:@"PictureLocation@3x.jpg"] forState:UIControlStateNormal];
//    //[locationButtion setImage:[UIImage imageNamed:@"PictureLocationSelected@3x.jpg"] forState:UIControlStateHighlighted];
//    [locationButtion addTarget:self action:@selector(buttionClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:locationButtion];
    
    //tableview
    UITableView *weatherTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.height/9)-12, self.view.bounds.size.width, (self.view.bounds.size.height))];
    [self.view addSubview:weatherTableView];
    
    self.listLoad = [[Loader1 alloc]init];

    [self.listLoad loadListData];
    self.listLoad.block1 = ^(ListModel1 *text1) {
        self.listMode1 = text1;
        [weatherTableView reloadData];
    };

    self.location = self.listMode1.location;

    weatherTableView.dataSource = self;
    weatherTableView.delegate = self;


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
        NSString *nowTime = [self getCurrentTime];
        cell.textLabel.text = [NSString stringWithFormat:@"数据更新于%@",nowTime];
        cell.textLabel.textColor = [UIColor grayColor];



    }else if(indexPath.row == 1)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"今日气温 ：%@℃", self.listMode1.temp];;;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", self.listMode1.condition];;
        cell.imageView.image = [UIImage imageNamed:@"qiwen@3x.png"];

        
    }else if(indexPath.row == 2)
    {
        cell.textLabel.text = @"湿度";
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _listMode1.shidu];;
        
        cell.imageView.image = [UIImage imageNamed:@"shidu.png"];

    }else if(indexPath.row == 3)
    {
        cell.textLabel.text = @"气压";
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _listMode1.qiya];;
        cell.imageView.image = [UIImage imageNamed:@"qiya@3x.png"];

    }else if(indexPath.row == 4)
    {
        cell.textLabel.text = @"风向";
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _listMode1.fengxiang];
        cell.imageView.image = [UIImage imageNamed:@"fengxiang@3x.png"];


    }else if(indexPath.row == 5)
    {
        cell.textLabel.text = @"风力";
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _listMode1.fengli];
        cell.imageView.image = [UIImage imageNamed:@"fengli.png"];


    }else if(indexPath.row == 6)
    {
        cell.textLabel.text = @"风速";
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _listMode1.fengsu];
        cell.imageView.image = [UIImage imageNamed:@"fengsu.png"];


    }else if(indexPath.row == 7)
    {
        cell.textLabel.text = @"提示";
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",_listMode1.tishi];
        cell.imageView.image = [UIImage imageNamed:@"tishi.png"];

    }
    

    return cell;
}
- (NSString *)getCurrentTime {

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];

//yyyy-MM-dd-hh-mm-ss

    [formatter setDateFormat:@"yyyy-MM-dd-hh:mm:ss"];

    NSString *dateTime = [formatter stringFromDate:[NSDate date]];

    return dateTime;

}


- (void)buttionClick
{
    NSLog(@"button click");


    UIViewController *viewController = [[UIViewController alloc]init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    viewController.navigationItem.title = @"内容";




    [self.navigationController pushViewController :viewController animated:YES];

    [self.view addSubview:self.navigationController.view];


}

/*
 #pragma mark - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
   }
 */

@end
