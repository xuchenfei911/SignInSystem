//
//  ListModel1.h
//  Weathter Forecast
//
//  Created by XuChenFei on 2020/12/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListModel1 : NSObject
@property(nonatomic,strong,readwrite)NSString *condition;
@property(nonatomic,strong,readwrite)NSString *temp;
@property(nonatomic,strong,readwrite)NSString *location;
@property(nonatomic,strong,readwrite)NSString *shidu;
@property(nonatomic,strong,readwrite)NSString *qiya;
@property(nonatomic,strong,readwrite)NSString *fengxiang;
@property(nonatomic,strong,readwrite)NSString *fengli;
@property(nonatomic,strong,readwrite)NSString *fengsu;
@property(nonatomic,strong,readwrite)NSString *tishi;

- (void)setValueWithDictionary:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
