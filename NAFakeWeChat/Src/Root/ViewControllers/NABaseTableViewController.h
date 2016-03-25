//
//  NABaseTableViewController.h
//  NAFakeWeChat
//
//  Created by zuopengl on 3/17/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NABaseTableViewController : UITableViewController

// override to init navigation bar button item
- (NSString *)navigationTitle;
- (UIBarButtonItem *)leftBarButtonItem;
- (NSArray<UIBarButtonItem *> *)leftBarButtonItems;
- (UIBarButtonItem *)rightBarButtonItem;
- (NSArray<UIBarButtonItem *> *)rightBarButtonItems;

- (CGFloat)heightOfNavigationBar;
- (CGFloat)heightOfStatusBar;
- (CGFloat)heightOfTabBar;
@end
