//
//  UIViewController+UINib.h
//  NAFakeWeChat
//
//  Created by zuopengl on 3/18/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (UINib)
+ (id)loadNibWithName:(NSString *)name;
+ (id)loadNibWithName:(NSString *)name inBundle:(NSBundle *)bundle owner:(id)owner;

- (id)loadNibWithName:(NSString *)name;
- (id)loadNibWithName:(NSString *)name inBundle:(NSBundle *)bundle owner:(id)owner;
@end
