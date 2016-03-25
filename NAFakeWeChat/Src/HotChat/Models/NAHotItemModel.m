//
//  NAHotItemModel.m
//  NAFakeWeChat
//
//  Created by zuopengl on 3/18/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "NAHotItemModel.h"

@interface NAHotItemModel ()
@property (nonatomic, strong) NSDate *date;
@end


@implementation NAHotItemModel
+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle image:(id)image incommingModel:(id)model {
    return [self itemWithTitle:title subTitle:subTitle image:image incommingModel:model targetClass:nil targetUrl:nil];
}

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle image:(id)image incommingModel:(id)model targetClass:(Class)targetClass targetUrl:(NSString *)targetUrl {
    return [[self alloc] initWithTitle:title subTitle:subTitle image:image incommingModel:model targetClass:targetClass targetUrl:targetUrl];
}

- (instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle image:(id)image incommingModel:(id)model targetClass:(Class)targetClass targetUrl:(NSString *)targetUrl {
    if ((self = [super initWithTitle:title image:image targetClass:targetClass targetUrl:targetUrl others:nil])) {
        self.subTitle = subTitle;
        self.incomingModel = model;
        self.date = [NSDate date];
    }
    return self;
}

@end
