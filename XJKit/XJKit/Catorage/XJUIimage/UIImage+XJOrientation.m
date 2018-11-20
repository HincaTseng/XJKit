//
//  UIImage+XJOrientation.m
//  XJKit
//
//  Created by 曾宪杰 on 2018/5/31.
//  Copyright © 2018年 曾宪杰. All rights reserved.
//

#import "UIImage+XJOrientation.h"

XJCategory_DUMMY_CLASS(UIImage_XJOrientation)

@implementation UIImage (XJOrientation)
/*
 它会将图像绘制到画布上，并且已经考虑好了图像的方向
 -drawInRect:
 Draws the entire image in the specified rectangle, scaling it as needed to fit.
 
 Discussion
 This method draws the entire image in the current graphics context, respecting the image’s orientation setting. In the default coordinate system, images are situated down and to the right of the origin of the specified rectangle. This method respects any transforms applied to the current graphics context, however.
 */
- (UIImage *)ImageOrientationUP {
    if (self.imageOrientation == UIImageOrientationUp)
        return self;
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    [self drawInRect:(CGRect){0,0,self.size}]; // [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    UIImage *imageorientationUp = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imageorientationUp;
}

@end
