//
//  ListModel2.h
//  Weathter Forecast
//
//  Created by XuChenFei on 2020/12/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListModel2 : NSObject

@property(nonatomic,strong,readwrite) NSString *qulityNum;
@property(nonatomic,strong,readwrite) NSString *rank;
@property(nonatomic,strong,readwrite) NSString *pm25;
@property(nonatomic,strong,readwrite) NSString *pm10;
@property(nonatomic,strong,readwrite) NSString *so2;
@property(nonatomic,strong,readwrite) NSString *no2;
@property(nonatomic,strong,readwrite) NSString *o3;
@property(nonatomic,strong,readwrite) NSString *co;

- (void)setValueWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END

