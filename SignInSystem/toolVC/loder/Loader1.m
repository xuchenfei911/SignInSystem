//
//  Loader1.m
//  Weathter Forecast
//
//  Created by XuChenFei on 2020/12/16.
//
#import "ListModel1.h"
#import "Loader1.h"

@implementation Loader1
- (void)loadListData
{
    NSString *appcode = @"f62a8f6b5df14227ac028ecf8541eb13";
    NSString *host = @"http://aliv13.data.moji.com";
    NSString *path = @"/whapi/json/alicityweather/condition";
    NSString *method = @"POST";
    NSString *querys = @"";
    NSString *url = [NSString stringWithFormat:@"%@%@%@",  host,  path, querys];
    NSString *bodys = @"cityId=2&token=50b53ff8dd7d9fa320d3d3ca32cf8ed1";

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: url]  cachePolicy:1  timeoutInterval:  5];
    request.HTTPMethod  =  method;
    [request addValue:  [NSString  stringWithFormat:@"APPCODE %@",  appcode]  forHTTPHeaderField:  @"Authorization"];
    [request addValue: @"application/x-www-form-urlencoded; charset=UTF-8" forHTTPHeaderField: @"Content-Type"];
    NSData *data = [bodys dataUsingEncoding: NSUTF8StringEncoding];
    [request setHTTPBody: data];
    NSURLSession *requestSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *task = [requestSession dataTaskWithRequest:request
                                  completionHandler:^(NSData * _Nullable body, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                          // NSLog(@"Response object: %@" , response);
                                          NSString *bodyString = [[NSString alloc] initWithData:body encoding:NSUTF8StringEncoding];
                                          //打印应答中的body
                                          NSLog(@"Response body: %@", bodyString);
                                          // NSData * data = [bodyString dataUsingEncoding:NSUTF8StringEncoding];
                                          id jsonDict = [NSJSONSerialization JSONObjectWithData:body options:0 error:nil];
                                          NSDictionary *nData = (NSDictionary *)[jsonDict objectForKey:@"data"];
                                          NSDictionary *nCity = (NSDictionary *)[nData objectForKey:@"city"];
                                          NSString *pname = [nCity objectForKey:@"pname"];
                                          NSDictionary *nCondition = (NSDictionary *)[nData objectForKey:@"condition"];
                                          self.mode1 = [[ListModel1 alloc]init];
                                          [self.mode1 setValueWithDictionary:nCity];
                                          [self.mode1 setValueWithDictionary:nCondition];
                                          [self.mode1 setLocation:pname];
                                          if(_block1)
                          {
                              _block1(self.mode1);
                          }

                      }];
    [task resume];
}

- (void)loadListData2
{
    NSString *appcode = @"f62a8f6b5df14227ac028ecf8541eb13";
    NSString *host = @"http://aliv13.data.moji.com";
    NSString *path = @"/whapi/json/alicityweather/aqi";
    NSString *method = @"POST";
    NSString *querys = @"";
    NSString *url = [NSString stringWithFormat:@"%@%@%@",  host,  path, querys];
    NSString *bodys = @"cityId=2&token=8b36edf8e3444047812be3a59d27bab9";

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: url]  cachePolicy:1  timeoutInterval:  5];
    request.HTTPMethod  =  method;
    [request addValue:  [NSString  stringWithFormat:@"APPCODE %@",  appcode]  forHTTPHeaderField:  @"Authorization"];
    [request addValue: @"application/x-www-form-urlencoded; charset=UTF-8" forHTTPHeaderField: @"Content-Type"];
    NSData *data = [bodys dataUsingEncoding: NSUTF8StringEncoding];
    [request setHTTPBody: data];
    NSURLSession *requestSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *task = [requestSession dataTaskWithRequest:request
                                  completionHandler:^(NSData * _Nullable body, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                          // NSLog(@"Response object: %@" , response);
                                          NSString *bodyString = [[NSString alloc] initWithData:body encoding:NSUTF8StringEncoding];

                                          //打印应答中的body
                                          NSLog(@"Response body: %@", bodyString);

                                          id jsonDict2 = [NSJSONSerialization JSONObjectWithData:body options:0 error:nil];


                                          NSDictionary *nData = (NSDictionary *)[jsonDict2 objectForKey:@"data"];
                                          NSDictionary *nAqi = (NSDictionary *)[nData objectForKey:@"aqi"];

                                          self.mode2 = [[ListModel2 alloc]init];
                                          [self.mode2 setValueWithDictionary:nAqi];

                                          NSLog(@"---------!!!!-%@",self.mode2.co);
                                          if(_block2)
                          {
                              _block2(self.mode2);
                          }
                      }];

    [task resume];

}
- (void)loadListData3
{
    NSString *appcode = @"f62a8f6b5df14227ac028ecf8541eb13";
    NSString *host = @"http://aliv13.data.moji.com";
    NSString *path = @"/whapi/json/alicityweather/briefforecast6days";
    NSString *method = @"POST";
    NSString *querys = @"";
    NSString *url = [NSString stringWithFormat:@"%@%@%@",  host,  path, querys];
    NSString *bodys = @"cityId=2&token=073854b56a84f8a4956ba3e273f6c9d7";

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: url]  cachePolicy:1  timeoutInterval:  5];
    request.HTTPMethod  =  method;
    [request addValue:  [NSString  stringWithFormat:@"APPCODE %@",  appcode]  forHTTPHeaderField:  @"Authorization"];
    [request addValue: @"application/x-www-form-urlencoded; charset=UTF-8" forHTTPHeaderField: @"Content-Type"];
    NSData *data = [bodys dataUsingEncoding: NSUTF8StringEncoding];
    [request setHTTPBody: data];
    NSURLSession *requestSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *task = [requestSession dataTaskWithRequest:request
                                  completionHandler:^(NSData * _Nullable body, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                          // NSLog(@"Response object: %@" , response);
                                          NSString *bodyString = [[NSString alloc] initWithData:body encoding:NSUTF8StringEncoding];

                                          //打印应答中的body
                                          NSLog(@"Response body: %@", bodyString);


                                          id jsonDict3 = [NSJSONSerialization JSONObjectWithData:body options:0 error:nil];
                                          NSDictionary *nData = (NSDictionary *)[jsonDict3 objectForKey:@"data"];
                                          NSDictionary *nForecast = (NSDictionary *)[nData objectForKey:@"forecast"];


                                          NSMutableArray *dataArray = [[NSMutableArray alloc]init];
                                          for (NSDictionary *info in nForecast)
                          {
                              self.mode3 = [[ListModel3 alloc]init];
                              [self.mode3 setValueWithDictionary:info];
                              [dataArray addObject:self.mode3];

                              NSLog(@"---------!!!!-%@",[info objectForKey:@"predictDate"]);

                              NSLog(@"---------!!!!-%@",self.mode3.predictDate);
                          }
                                          if(_block3)
                          {
                              _block3(dataArray);
                          }




                      }];

    [task resume];
}
- (void)loadListData4
{
    NSString *appcode = @"f62a8f6b5df14227ac028ecf8541eb13";
    NSString *host = @"http://aliv13.data.moji.com";
    NSString *path = @"/whapi/json/alicityweather/alert";
    NSString *method = @"POST";
    NSString *querys = @"";
    NSString *url = [NSString stringWithFormat:@"%@%@%@",  host,  path, querys];
    NSString *bodys = @"cityId=2&token=7ebe966ee2e04bbd8cdbc0b84f7f3bc7";

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: url]  cachePolicy:1  timeoutInterval:  5];
    request.HTTPMethod  =  method;
    [request addValue:  [NSString  stringWithFormat:@"APPCODE %@",  appcode]  forHTTPHeaderField:  @"Authorization"];
    [request addValue: @"application/x-www-form-urlencoded; charset=UTF-8" forHTTPHeaderField: @"Content-Type"];
    NSData *data = [bodys dataUsingEncoding: NSUTF8StringEncoding];
    [request setHTTPBody: data];
    NSURLSession *requestSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *task = [requestSession dataTaskWithRequest:request
                                  completionHandler:^(NSData * _Nullable body, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                          //NSLog(@"Response object: %@" , response);
                                          NSString *bodyString = [[NSString alloc] initWithData:body encoding:NSUTF8StringEncoding];

                                          //打印应答中的body
                                          NSLog(@"Response body: %@", bodyString);

                                          id jsonDict4 = [NSJSONSerialization JSONObjectWithData:body options:0 error:nil];


                                          self.mode4 = [[ListModel4 alloc]init];
                      }];

    [task resume];
}
- (void)loadListData5;
{
    NSString *appcode = @"f62a8f6b5df14227ac028ecf8541eb13";
    NSString *host = @"http://aliv13.data.moji.com";
    NSString *path = @"/whapi/json/aliweather/limit";
    NSString *method = @"POST";
    NSString *querys = @"";
    NSString *url = [NSString stringWithFormat:@"%@%@%@",  host,  path, querys];
    NSString *bodys = @"cityId=2&token=27200005b3475f8b0e26428f9bfb13e9";

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: url]  cachePolicy:1  timeoutInterval:  5];
    request.HTTPMethod  =  method;
    [request addValue:  [NSString  stringWithFormat:@"APPCODE %@",  appcode]  forHTTPHeaderField:  @"Authorization"];
    [request addValue: @"application/x-www-form-urlencoded; charset=UTF-8" forHTTPHeaderField: @"Content-Type"];
    NSData *data = [bodys dataUsingEncoding: NSUTF8StringEncoding];
    [request setHTTPBody: data];
    NSURLSession *requestSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *task = [requestSession dataTaskWithRequest:request
                                  completionHandler:^(NSData * _Nullable body, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                          //NSLog(@"Response object: %@" , response);
                                          NSString *bodyString = [[NSString alloc] initWithData:body encoding:NSUTF8StringEncoding];

                                          //打印应答中的body
                                          NSLog(@"Response body: %@", bodyString);

                                          id jsonDict5 = [NSJSONSerialization JSONObjectWithData:body options:0 error:nil];


                                          
                                          NSDictionary *nData = (NSDictionary *)[jsonDict5 objectForKey:@"data"];
                                          NSDictionary *nLimit = (NSDictionary *)[nData objectForKey:@"limit"];


                                          NSMutableArray *dataArray = [[NSMutableArray alloc]init];
                                          for (NSDictionary *info in nLimit)
                          {
                              self.mode5 = [[ListModel5 alloc]init];
                              [self.mode5 setValueWithDictionary:info];
                              [dataArray addObject:self.mode5];

                              NSLog(@"---------!!!!-");

                              //NSLog(@"---------!!!!-%@",self.mode3.predictDate);
                          }
                                          if(_block5)
                          {
                              _block5(dataArray);
                          }

                      }];

    [task resume];
}

@end
