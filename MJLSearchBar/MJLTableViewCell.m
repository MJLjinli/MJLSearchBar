//
//  MJLTableViewCell.m
//  MJLSearchBar
//
//  Created by 马金丽 on 17/7/10.
//  Copyright © 2017年 majinli. All rights reserved.
//

#import "MJLTableViewCell.h"
#import <Masonry.h>

@interface MJLTableViewCell()

@property(nonatomic,strong)UIImageView *mainImageView;

@end

@implementation MJLTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.mainImageView];
        [_mainImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentView.mas_top).mas_offset(5);
            make.left.mas_equalTo(self.contentView.mas_left).mas_offset(5);
            make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-5);
            make.width.mas_equalTo(_mainImageView.mas_height);
 
        }];
        self.contentView.backgroundColor = [UIColor grayColor];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (UIImageView *)mainImageView
{
    if (!_mainImageView) {
        _mainImageView = [[UIImageView alloc]init];
        _mainImageView.backgroundColor = [UIColor redColor];
    }
    return _mainImageView;
}
@end
