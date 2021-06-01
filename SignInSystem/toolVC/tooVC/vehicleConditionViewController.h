//
//  vehicleConditionViewController.h
//  signIn
//
//  Created by xuchenfei on 2021/4/13.
//

#import <UIKit/UIKit.h>
#import "Loader1.h"
#import "ListModel5.h"
NS_ASSUME_NONNULL_BEGIN

@interface vehicleConditionViewController : UIViewController

@property(nonatomic,strong,readwrite)Loader1 *listLoad5;
@property(nonatomic,strong,readwrite)NSArray <ListModel5 *>*arrayMode5;

@end

NS_ASSUME_NONNULL_END
