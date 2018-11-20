//
//  UIImage+GaussianBlur.h
//  
//
//  Created by 曾宪杰 on 2018/8/6.
//  Copyright © 2018年 zengxianjie. All rights reserved.
//
/*
    引入Accelerate.framework
 UIImage *img = [UIImage vG...];
 UIImagView.image = img;
 */
#import <UIKit/UIKit.h>

@interface UIImage (GaussianBlur)
+ (UIImage *)vGaussianBlurImage:(UIImage *)img blurApl:(CGFloat)apl;

@end
