//
//  NABaseHotCell.h
//  NAFakeWeChat
//
//  Created by zuopengl on 3/18/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NABaseHotCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *thumbImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@end
