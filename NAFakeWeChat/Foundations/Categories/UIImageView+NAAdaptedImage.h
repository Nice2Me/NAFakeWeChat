//
//  UIImageView+NAAdaptedImage.h
//  NAFakeWeChat
//
//  Created by zuopengl on 3/17/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIImageView (NAAdaptedImage)
- (void)na_setImage:(id)image;
- (void)na_setImage:(id)image selectedImage:(id)selectedImage;
@end
