//
//  NABaseContactCell.m
//  NAFakeWeChat
//
//  Created by zuopengl on 3/18/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "NABaseContactCell.h"
#import "NAContactItemModel.h"

@implementation NABaseContactCell

- (void)updateWithModel:(NAContactItemModel *)model {
    self.titleLabel.text = model.title;
}

@end
