//
//  showDataTableViewCell.h
//  SignInSystem
//
//  Created by bytedance on 2021/5/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface showDataTableViewCell : UITableViewCell
- (void)layoutTableViewCellWithTitle:(NSString *)title andWithSource:(NSString *)source andWithComment:(NSString *)comment andWithTime:(NSString *)time andWithPictureString:(NSString *)pictureString;
@end

NS_ASSUME_NONNULL_END
