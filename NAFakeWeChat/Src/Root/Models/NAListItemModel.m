//
//  NAListItemModel.m
//  NAFakeWeChat
//
//  Created by zuopengl on 3/18/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "NAListItemModel.h"

@implementation NAListItemModel

+ (instancetype)itemWithTitle:(NSString *)title image:(id)image {
    return [[self alloc] initWithTitle:title image:image targetClass:nil targetUrl:nil others:nil];
}

- (instancetype)initWithTitle:(NSString *)title image:(id)image targetClass:(Class)targetClass targetUrl:(NSString *)targetUrl others:(NSDictionary *)others {
    if ((self = [super init])) {
        self.title = title;
        self.image = image;
        self.targetClass = targetClass;
        self.targetUrl = self.targetUrl;
        self.others = others;
    }
    return self;
}

@end
