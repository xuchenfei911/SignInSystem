//
//  ListModel2.m
//  Weathter Forecast
//
//  Created by XuChenFei on 2020/12/17.
//

#import "ListModel2.h"

@implementation ListModel2
- (void)setValueWithDictionary:(NSDictionary *)dictionary
{
    self.qulityNum = [dictionary objectForKey:@"value"];
    self.rank = [dictionary objectForKey:@"rank"];
    self.pm25 = [dictionary objectForKey:@"pm25"];
    self.pm10 = [dictionary objectForKey:@"pm10"];
    self.so2 = [dictionary objectForKey:@"so2"];
    self.no2 = [dictionary objectForKey:@"no2"];
    self.o3 = [dictionary objectForKey:@"o3"];
    self.co = [dictionary objectForKey:@"co"];
}
@end
