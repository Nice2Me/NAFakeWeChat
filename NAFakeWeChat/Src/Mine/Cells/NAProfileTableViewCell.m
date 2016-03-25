//
//  NAProfileTableViewCell.m
//  NAFakeWeChat
//
//  Created by zuopengl on 3/17/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "NAProfileTableViewCell.h"
#import "NAMineModel.h"

@implementation NAProfileTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateWithItem:(NAProfileItem *)profileItem {
    [self.avatarImageView na_setImage:[profileItem valueForKey:@"_image"]];
    self.titleLabel.text = [profileItem valueForKey:@"_title"];
    self.subTitleLabel.text = [profileItem valueForKey:@"_subTitle"];
    [self.qrCodeImageView na_setImage:[profileItem valueForKey:@"_qrCode"]];
}

@end
