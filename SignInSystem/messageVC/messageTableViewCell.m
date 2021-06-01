//
//  messageTableViewCell.m
//  SignInSystem
//
//  Created by bytedance on 2021/5/12.
//

#import "messageTableViewCell.h"

@interface messageTableViewCell()

@property (nonatomic,strong,readwrite) UILabel *titleLabel;
@property (nonatomic,strong,readwrite) UILabel *sourceLabel;
@property (nonatomic,strong,readwrite) UILabel *commentLabel;
@property (nonatomic,strong,readwrite) UILabel *timeLabel;

@property (nonatomic,strong,readwrite) UIImageView *rightImageView;

@property (nonatomic,strong,readwrite) UIButton *deleteButton;


@end

@implementation messageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 15, self.window.frame.size.width, 50)];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel.numberOfLines = 0;
            self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
            [self.titleLabel sizeToFit];
            self.titleLabel;
                                      
        })];
        
    }
    return self;
}

- (void)setTextWithString:(NSString *)text
{
    self.textLabel.text = text;
}

- (void)deleteButtonClick {
    
}
@end


