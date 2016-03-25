//
//  NAHuntingItemModel.h
//  NAFakeWeChat
//
//  Created by zuopengl on 3/18/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NAHuntingItemModel : NAListItemModel
@property (nonatomic, assign, readonly, getter=isNew) BOOL new; // default is NO
@property (nonatomic, strong) id incomingModel; //推荐并且将展示的信息

+ (instancetype)itemWithTitle:(NSString *)title image:(id)image incommingModel:(id)model;
+ (instancetype)itemWithTitle:(NSString *)title image:(id)image incommingModel:(id)model targetClass:(Class)targetClass targetUrl:(NSString *)targetUrl;
@end
