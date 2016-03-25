//
//  NAListItemModel.h
//  NAFakeWeChat
//
//  Created by zuopengl on 3/18/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NAListItemModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) id image; // imageName or imageUrl

@property (nonatomic, strong) Class targetClass;
@property (nonatomic, copy) NSString *targetUrl; //for schema

@property (nonatomic, copy) NSDictionary *others; 

+ (instancetype)itemWithTitle:(NSString *)title image:(id)image;
- (instancetype)initWithTitle:(NSString *)title image:(id)image targetClass:(Class)targetClass targetUrl:(NSString *)targetUrl others:(NSDictionary *)others;

@end
