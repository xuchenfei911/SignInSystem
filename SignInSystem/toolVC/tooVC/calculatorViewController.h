//
//  calculatorViewController.h
//  signIn
//
//  Created by xuchenfei on 2021/4/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface calculatorViewController : UIViewController

@property(nonatomic,strong,readwrite)UIButton *buttonValue0;
@property(nonatomic,strong,readwrite)UIButton *buttonValue1;
@property(nonatomic,strong,readwrite)UIButton *buttonValue2;
@property(nonatomic,strong,readwrite)UIButton *buttonValue3;
@property(nonatomic,strong,readwrite)UIButton *buttonValue4;
@property(nonatomic,strong,readwrite)UIButton *buttonValue5;
@property(nonatomic,strong,readwrite)UIButton *buttonValue6;
@property(nonatomic,strong,readwrite)UIButton *buttonValue7;
@property(nonatomic,strong,readwrite)UIButton *buttonValue8;
@property(nonatomic,strong,readwrite)UIButton *buttonValue9;

@property(nonatomic,strong,readwrite)UIButton *buttonValueEqual;
@property(nonatomic,strong,readwrite)UIButton *buttonValuePlus;
@property(nonatomic,strong,readwrite)UIButton *buttonValueMinus;
@property(nonatomic,strong,readwrite)UIButton *buttonValueRide;

@property(nonatomic,strong,readwrite)UIButton *buttonValueAC;
@property(nonatomic,strong,readwrite)UIButton *buttonValueDouble;
@property(nonatomic,strong,readwrite)UIButton *buttonValueBai;
@property(nonatomic,strong,readwrite)UIButton *buttonValueDivide;
@property(nonatomic,strong,readwrite)UIButton *buttonValuePoint;

@property(nonatomic,strong,readwrite)UILabel *showLabel;
@property(nonatomic,strong,readwrite)NSString *ShowContent;
@property(nonatomic,strong,readwrite)NSString *result;
@property(nonatomic,strong,readwrite)NSString *expression;

- (NSString *)calculateWithString:(NSString *)string;
- (int)calculateWith:(char *)s;
@property(nonatomic,strong,readwrite)NSString *tempString;

@end

NS_ASSUME_NONNULL_END
