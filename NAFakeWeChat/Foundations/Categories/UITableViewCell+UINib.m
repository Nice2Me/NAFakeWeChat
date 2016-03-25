//
//  UITableViewCell+UINib.m
//  NAFakeWeChat
//
//  Created by zuopengl on 3/18/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "UITableViewCell+UINib.h"

@implementation UITableViewCell (UINib)
+ (id)loadInstanceFromNib {
    return [self loadInstanceFromNibWithName:NSStringFromClass([self class]) inBundle:[NSBundle mainBundle] owner:nil];
}

+ (id)loadInstanceFromNibWithName:(NSString *)name inBundle:(NSBundle *)bundle owner:(id)owner {
    UINib *nib = [UINib nibWithNibName:name bundle:bundle];
    return [[nib instantiateWithOwner:owner options:nil] firstObject];
}

- (id)loadInstanceFromNib {
    return [self loadInstanceFromNibWithName:NSStringFromClass([self class]) inBundle:[NSBundle mainBundle] owner:nil];
}

- (id)loadInstanceFromNibWithName:(NSString *)name inBundle:(NSBundle *)bundle owner:(id)owner {
    UINib *nib = [UINib nibWithNibName:name bundle:bundle];
    return [[nib instantiateWithOwner:owner options:nil] firstObject];
}
@end
