//
//  NABaseThumbTitleCell.h
//  NAFakeWeChat
//
//  Created by zuopengl on 3/17/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NAMineItem;

@interface NABaseThumbTitleCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *thumbImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImageView;


- (void)setShowArrow:(BOOL)showArrow;
- (void)updateWithItem:(NAMineItem *)item;
@end
