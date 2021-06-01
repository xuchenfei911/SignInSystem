//
//  ListModel3.h
//  Weathter Forecast
//
//  Created by XuChenFei on 2020/12/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListModel3 : NSObject
@property(nonatomic,strong,readwrite) NSString *predictDate;
@property(nonatomic,strong,readwrite) NSString *tempDay;
@property(nonatomic,strong,readwrite) NSString *tempNight;
@property(nonatomic,strong,readwrite) NSString *windDirDay;
@property(nonatomic,strong,readwrite) NSString *windDirNight;
@property(nonatomic,strong,readwrite) NSString *windLevelDay;
@property(nonatomic,strong,readwrite) NSString *windLevelNight;

- (void)setValueWithDictionary:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
