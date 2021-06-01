//
//  sevenWeatherViewController.h
//  signIn
//
//  Created by xuchenfei on 2021/4/13.
//

#import <UIKit/UIKit.h>
#import "Loader1.h"
#import "ListModel3.h"
NS_ASSUME_NONNULL_BEGIN

@interface sevenWeatherViewController : UIViewController

@property(nonatomic,strong,readwrite)Loader1 *listLoad3;
@property(nonatomic,strong,readwrite)ListModel3 *listMode3;
@property(nonatomic,strong,readwrite)NSArray <ListModel3 *>*arrayMode3;

@end

NS_ASSUME_NONNULL_END
