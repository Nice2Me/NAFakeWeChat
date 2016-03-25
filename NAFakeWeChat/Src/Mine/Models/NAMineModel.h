//
//  NAMineModel.h
//  NAFakeWeChat
//
//  Created by zuopengl on 3/17/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#ifndef NAMineModel_h
#define NAMineModel_h

/**
 *  NAMineItem
 */
@interface NAMineItem : NAListItemModel
@property (nonatomic, assign, getter=isNew) BOOL new; // default is NO

+ (instancetype)itemWithTitle:(NSString *)title image:(id)image isNew:(BOOL)new;
- (instancetype)initWithTitle:(NSString *)title image:(id)image isNew:(BOOL)new targetClass:(Class)targetClass targetUrl:(NSString *)targetUrl others:(NSDictionary *)others;
@end


/**
 *  NAProfileItem
 */
@interface NAProfileItem : NAMineItem
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, strong) id qrCode;

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle image:(id)image qrCode:(id)qrCode;
@end

#endif /* NAMineModel_h */
