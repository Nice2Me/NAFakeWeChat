//
//  NABaseArrowCell.m
//  NAFakeWeChat
//
//  Created by zuopengl on 3/18/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "NABaseArrowCell.h"

@implementation NABaseArrowCell

- (void)updateWithItem:(NAListItemModel *)model {
    if (model) {
        self.titleLabel.text = model.title;
    }
}

@end
