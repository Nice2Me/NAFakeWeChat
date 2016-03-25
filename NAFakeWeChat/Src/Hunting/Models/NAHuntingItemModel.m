//
//  NAHuntingItemModel.m
//  NAFakeWeChat
//
//  Created by zuopengl on 3/18/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "NAHuntingItemModel.h"

@implementation NAHuntingItemModel
+ (instancetype)itemWithTitle:(NSString *)title image:(id)image incommingModel:(id)model {
    return [self itemWithTitle:title image:image incommingModel:model targetClass:nil targetUrl:nil];
}

+ (instancetype)itemWithTitle:(NSString *)title image:(id)image incommingModel:(id)model targetClass:(Class)targetClass targetUrl:(NSString *)targetUrl {
    return [[self alloc] initWithTitle:title image:image incommingModel:model targetClass:targetClass targetUrl:targetUrl];
}

- (instancetype)initWithTitle:(NSString *)title image:(id)image incommingModel:(id)model targetClass:(Class)targetClass targetUrl:(NSString *)targetUrl {
    if ((self = [super initWithTitle:title image:image targetClass:targetClass targetUrl:targetUrl others:nil])) {
        _new = (self.incomingModel != NULL);
        self.incomingModel = model;
    }
    return self;
}

- (void)setIncomingModel:(id)incomingModel {
    if (incomingModel && _incomingModel != incomingModel) {
        _new = YES;
    } else {
        _new = NO;
    }
    _incomingModel = incomingModel;
}
@end
