//
//  NATabBarController.m
//  NAFakeWeChat
//
//  Created by zuopengl on 3/17/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "NATabBarController.h"
//#import "NAAssociationMacros.h"

@implementation NATabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // modify subViewcontroller's tabBar
    NSArray *tabBarTitles = @[@"微信", @"通讯录", @"发现", @"我"];
    NSArray *tabBarImages = @[@"微信", @"通讯录", @"发现", @"我"];
    NSArray *tabBarSelectedImages = @[@"微信", @"通讯录", @"发现", @"我"];
    [self.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.tabBarItem.title = safeObjectFromArray(tabBarTitles, idx);
        obj.tabBarItem.image = nil;
        obj.tabBarItem.selectedImage = nil;
    }];
}

@end
