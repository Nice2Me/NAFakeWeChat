//
//  NAHotItemModel.h
//  NAFakeWeChat
//
//  Created by zuopengl on 3/18/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NAHotItemModel : NAListItemModel
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, strong, readonly) NSString *dateString;
@property (nonatomic, strong) id incomingModel; //推荐的信息

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle image:(id)image incommingModel:(id)model;
+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle image:(id)image incommingModel:(id)model targetClass:(Class)targetClass targetUrl:(NSString *)targetUrl;
@end
