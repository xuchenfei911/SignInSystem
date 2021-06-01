//
//  JSToastDialogs.h
//  SignInSystem
//
//  Created by bytedance on 2021/5/9.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//声明定义一个DialogsLabel对象
@interface DialogsLabel : UILabel
- (void)setMessageText:(NSString *)text;
@end


@interface JSToastDialogs : NSObject {
    DialogsLabel *dialogsLabel;
    NSTimer *countTimer;
}
//创建声明单例方法
+ (instancetype)shareInstance;
- (void)makeToast:(NSString *)message duration:(CGFloat)duration;

@end


