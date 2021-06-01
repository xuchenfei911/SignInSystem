//
//  newsTableViewCell.m
//  SignInSystem
//
//  Created by bytedance on 2021/5/11.
//

#import "newsTableViewCell.h"

@interface newsTableViewCell()

@property (nonatomic,strong,readwrite) UILabel *titleLabel;
@property (nonatomic,strong,readwrite) UILabel *sourceLabel;
@property (nonatomic,strong,readwrite) UILabel *commentLabel;
@property (nonatomic,strong,readwrite) UILabel *timeLabel;

@property (nonatomic,strong,readwrite) UIImageView *rightImageView;

@property (nonatomic,strong,readwrite) UIButton *deleteButton;


@end

@implementation newsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 15, 300, 50)];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel;
                                      
        })];
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 80, 80, 20)];
            self.sourceLabel.textColor = [UIColor grayColor];
            self.sourceLabel.font = [UIFont systemFontOfSize:14];
            self.sourceLabel;
                                      
        })];
        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 80, 80, 20)];
            self.commentLabel.textColor = [UIColor grayColor];
            self.commentLabel.font = [UIFont systemFontOfSize:14];
            self.commentLabel;
                                      
        })];
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, 80, 80, 20)];
            self.timeLabel.textColor = [UIColor grayColor];
            self.timeLabel.font = [UIFont systemFontOfSize:14];
            self.timeLabel;
                                      
        })];
        [self.contentView addSubview:({
            self.rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(330, 15, 80, 80)];
            self.rightImageView.contentMode = UIViewContentModeScaleToFill;
            self.rightImageView;
                                      
        })];
//        [self.contentView addSubview:({
//            self.deleteButton = [[UIButton alloc]initWithFrame:CGRectMake(290, 80, 30, 20)];
//            [self.deleteButton setTitle:@"X" forState:UIControlStateNormal];
//            [self.deleteButton setTitle:@"V" forState:UIControlStateHighlighted];
//            [self.deleteButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
//            self.deleteButton.backgroundColor = [UIColor blueColor];
//            self.deleteButton;
//                                      
//        })];
    }
    return self;
}

- (void)layoutTableViewCellWithTitle:(NSString *)title andWithSource:(NSString *)source andWithComment:(NSString *)comment andWithTime:(NSString *)time andWithPictureString:(NSString *)pictureString{
    self.titleLabel.text = title;
    
    self.sourceLabel.text = source;
    [self.sourceLabel sizeToFit];
    
    self.commentLabel.text = comment;
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width+25, self.commentLabel.frame.origin.y, self.commentLabel.frame.size.width, self.commentLabel.frame.size.height);
    
    self.timeLabel.text = time;
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(self.commentLabel.frame.origin.x + self.commentLabel.frame.size.width+25, self.timeLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);
    
    self.rightImageView.image = [UIImage imageNamed:pictureString];
}

- (void)deleteButtonClick {
    
}
@end
