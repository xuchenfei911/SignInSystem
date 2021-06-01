//
//  nowWeatherViewController.h
//  signIn
//
//  Created by xuchenfei on 2021/4/13.
//

#import <UIKit/UIKit.h>
#import "Loader1.h"
#import "ListModel1.h"
NS_ASSUME_NONNULL_BEGIN

@interface nowWeatherViewController : UIViewController

@property(nonatomic,strong,readwrite)Loader1 *listLoad;
@property(nonatomic,strong,readwrite)ListModel1 *listMode1;
@property(nonatomic,strong,readwrite)NSString *location;

@end

NS_ASSUME_NONNULL_END
