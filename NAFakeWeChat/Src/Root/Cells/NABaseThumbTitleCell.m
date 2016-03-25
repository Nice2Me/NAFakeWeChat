//
//  NABaseThumbTitleCell.m
//  NAFakeWeChat
//
//  Created by zuopengl on 3/17/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "NABaseThumbTitleCell.h"
#import "NAMineModel.h"


@interface NABaseThumbTitleCell ()
@property (nonatomic, assign) BOOL showArrow;

@property (nonatomic, strong) UIColor *customBgColor;
@property (nonatomic, strong) UIColor *customSelectedBgColor;
@end


@implementation NABaseThumbTitleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        self.backgroundView = [[UIView alloc] init];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        self.backgroundView = [[UIView alloc] initWithFrame:self.contentView.bounds];
        self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.contentView.bounds];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self setupBackgroundColor];
}


- (void)setupBackgroundColor {
    self.backgroundView.backgroundColor = self.customBgColor;
    if (_showArrow) {
        self.arrowImageView.hidden = NO;
        self.selectedBackgroundView.backgroundColor = self.customSelectedBgColor;
//        self.userInteractionEnabled = YES;
    } else {
        self.arrowImageView.hidden = YES;
        self.selectedBackgroundView.backgroundColor = self.customSelectedBgColor;
//        self.userInteractionEnabled = NO;
    }
}

- (void)awakeFromNib {
    // Initialization code
    self.customBgColor = [UIColor clearColor];
    self.customSelectedBgColor = [UIColor redColor];
    
    [self setupBackgroundColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - property

- (void)setShowArrow:(BOOL)showArrow {
    if (_showArrow != showArrow) {
        _showArrow = showArrow;
        [self layoutIfNeeded];
    }
}

- (void)updateWithItem:(NAMineItem *)item {
    [self.thumbImageView na_setImage:[item valueForKey:@"_image"]];
    self.titleLabel.text = item.title;
}

@end
