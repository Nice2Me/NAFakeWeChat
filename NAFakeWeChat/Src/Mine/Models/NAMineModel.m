//
//  NAMineModel.m
//  NAFakeWeChat
//
//  Created by zuopengl on 3/17/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NAMineModel.h"



@implementation NAMineItem
+ (instancetype)itemWithTitle:(NSString *)title image:(id)image isNew:(BOOL)new {
    return [[self alloc] initWithTitle:title image:image isNew:new targetClass:nil targetUrl:nil others:nil];
}

- (instancetype)initWithTitle:(NSString *)title image:(id)image isNew:(BOOL)new targetClass:(Class)targetClass targetUrl:(NSString *)targetUrl others:(NSDictionary *)others {
    if ((self = [super initWithTitle:title image:image targetClass:targetClass targetUrl:targetUrl others:others])) {
        self.new = new;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title image:(id)image targetClass:(Class)targetClass targetUrl:(NSString *)targetUrl others:(NSDictionary *)others {
    if ((self = [super initWithTitle:title image:image targetClass:targetClass targetUrl:targetUrl others:others])) {
        self.new = NO;
    }
    return self;
}
@end




/**
 *  NAProfileItem
 */
@implementation NAProfileItem
+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle image:(id)image qrCode:(id)qrCode {
    NAProfileItem *profileItem = nil;
    if((profileItem = [NAProfileItem itemWithTitle:title image:image isNew:NO])) {
        profileItem.subTitle = subTitle;
        profileItem.qrCode = qrCode;
    }
    return profileItem;
}
@end
