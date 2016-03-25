//
//  UIImageView+NAAdaptedImage.m
//  NAFakeWeChat
//
//  Created by zuopengl on 3/17/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "UIImageView+NAAdaptedImage.h"
#import "UIImageView+WebCache.h"


@implementation UIImageView (NAAdaptedImage)
- (void)na_setImage:(id)image {
    [self na_setImage:image selectedImage:nil];
}

- (void)na_setImage:(id)image selectedImage:(id)selectedImage {
    if ([image isKindOfClass:[UIImage class]]) {
        self.image = (UIImage *)image;
    } else {
        [self sd_setImageWithURL:image completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if (image) {
                self.image = image;
            }
        }];
    }
    
    if ([selectedImage isKindOfClass:[UIImage class]]) {
        self.highlightedImage = selectedImage;
    } else {
        [self sd_setImageWithURL:selectedImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if (image) {
                self.highlightedImage = image;
            }
        }];
    }
}
@end
