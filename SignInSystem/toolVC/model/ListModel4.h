//
//  ListModel4.h
//  Weathter Forecast
//
//  Created by XuChenFei on 2020/12/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListModel4 : NSObject

@property(nonatomic,strong,readwrite) NSString *day;
@property(nonatomic,strong,readwrite) NSString *info;

- (void)setValueWithDictionary:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
