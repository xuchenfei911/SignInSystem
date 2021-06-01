//
//  ListModel5.m
//  Weathter Forecast
//
//  Created by XuChenFei on 2020/12/17.
//

#import "ListModel5.h"

@implementation ListModel5
- (void)setValueWithDictionary:(NSDictionary *)dictionary
{
    self.data = [dictionary objectForKey:@"date"];
    self.prompt = [dictionary objectForKey:@"prompt"];
}
@end
