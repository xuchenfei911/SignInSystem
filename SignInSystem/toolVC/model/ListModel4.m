//
//  ListModel4.m
//  Weathter Forecast
//
//  Created by XuChenFei on 2020/12/17.
//

#import "ListModel4.h"

@implementation ListModel4
- (void)setValueWithDictionary:(NSDictionary *)dictionary
{
    self.day = [dictionary objectForKey:@"day"];
    self.info = [dictionary objectForKey:@"info"];
}
@end
