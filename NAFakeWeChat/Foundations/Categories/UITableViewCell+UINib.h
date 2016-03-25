//
//  UITableViewCell+UINib.h
//  NAFakeWeChat
//
//  Created by zuopengl on 3/18/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (UINib)
+ (id)loadInstanceFromNib;
+ (id)loadInstanceFromNibWithName:(NSString *)name inBundle:(NSBundle *)bundle owner:(id)owner;

- (id)loadInstanceFromNib;
- (id)loadInstanceFromNibWithName:(NSString *)name inBundle:(NSBundle *)bundle owner:(id)owner;
@end
