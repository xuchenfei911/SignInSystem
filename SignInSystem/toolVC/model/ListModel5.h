//
//  ListModel5.h
//  Weathter Forecast
//
//  Created by XuChenFei on 2020/12/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListModel5 : NSObject
@property(nonatomic,strong,readwrite) NSString *data;
@property(nonatomic,strong,readwrite) NSString *prompt;//限行信息

- (void)setValueWithDictionary:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
