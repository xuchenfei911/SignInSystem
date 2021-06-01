//
//  ListModel3.m
//  Weathter Forecast
//
//  Created by XuChenFei on 2020/12/17.
//

#import "ListModel3.h"

@implementation ListModel3
- (void)setValueWithDictionary:(NSDictionary *)dictionary
{
    self.predictDate = [dictionary objectForKey:@"predictDate"];
    self.tempDay = [dictionary objectForKey:@"tempDay"];
    self.tempNight = [dictionary objectForKey:@"tempNight"];
    self.windDirDay = [dictionary objectForKey:@"windDirDay"];
    self.windDirNight = [dictionary objectForKey:@"windDirNight"];
    self.windLevelDay = [dictionary objectForKey:@"windLevelDay"];
    self.windLevelNight = [dictionary objectForKey:@"windLevelNight"];
}
@end
