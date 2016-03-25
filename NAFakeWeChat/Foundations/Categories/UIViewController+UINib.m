//
//  UIViewController+UINib.m
//  NAFakeWeChat
//
//  Created by zuopengl on 3/18/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "UIViewController+UINib.h"

@implementation UIViewController (UINib)
+ (id)loadNibWithName:(NSString *)name {
    return [self loadNibWithName:name inBundle:[NSBundle mainBundle] owner:nil];
}

+ (id)loadNibWithName:(NSString *)name inBundle:(NSBundle *)bundle owner:(id)owner {
    UINib *nib = [UINib nibWithNibName:name bundle:bundle];
    return [[nib instantiateWithOwner:owner options:nil] firstObject];
}

- (id)loadNibWithName:(NSString *)name {
    return [self loadNibWithName:name inBundle:[NSBundle mainBundle] owner:nil];
}

- (id)loadNibWithName:(NSString *)name inBundle:(NSBundle *)bundle owner:(id)owner {
    UINib *nib = [UINib nibWithNibName:name bundle:bundle];
    return [[nib instantiateWithOwner:owner options:nil] firstObject];
}
@end
