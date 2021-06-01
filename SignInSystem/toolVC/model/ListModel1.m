//
//  ListModel1.m
//  Weathter Forecast
//
//  Created by XuChenFei on 2020/12/16.
//

#import "ListModel1.h"

@implementation ListModel1
- (void)setValueWithDictionary:(NSDictionary *)dictionary
{
    self.condition = [dictionary objectForKey:@"condition"];
    self.temp = [dictionary objectForKey:@"temp"];
    self.location = [dictionary objectForKey:@"cityId"];
    //self.picture = [dictionary objectForKey:@"condition"];
    self.shidu = [dictionary objectForKey:@"humidity"];
    self.qiya = [dictionary objectForKey:@"pressure"];
    self.fengxiang = [dictionary objectForKey:@"windDir"];
    self.fengli = [dictionary objectForKey:@"windLevel"];
    self.fengsu = [dictionary objectForKey:@"windSpeed"];
    self.tishi = [dictionary objectForKey:@"tips"];
}
@end
