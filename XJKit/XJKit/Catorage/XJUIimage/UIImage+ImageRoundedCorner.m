//
//  UIImage+ImageRoundedCorner.m
//  XJKit
//
//  Created by 曾宪杰 on 2018/7/18.
//  Copyright © 2018年 曾宪杰. All rights reserved.
//

#import "UIImage+ImageRoundedCorner.h"

XJCategory_DUMMY_CLASS(UIImage_ImageRoundedCorner)

@implementation UIImage (ImageRoundedCorner)

- (UIImage*)imageAddCornerWithRadius:(CGFloat)radius andSize:(CGSize)size{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    CGContextAddPath(ctx,path.CGPath);
    CGContextClip(ctx);
    [self drawInRect:rect];
    CGContextDrawPath(ctx, kCGPathFillStroke);
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImageView *)imgviewWithLayer:(UIImageView *)imgv {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:imgv.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:imgv.bounds.size];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = imgv.bounds;
    maskLayer.path = maskPath.CGPath;
    imgv.layer.mask = maskLayer;
    return imgv;
}
/*
 UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(200, 200, 200, 200)];
 imageView.image = [UIImage imageNamed:@"1"];
 UIBezierPath * maskPath = [UIBezierPath bezierPathWithRoundedRect:imageView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:imageView.bounds.size];
 CAShapeLayer * maskLayer = [[CAShapeLayer alloc]init];
 maskLayer.frame = imageView.bounds;
 maskLayer.path = maskPath.CGPath;
 imageView.layer.mask = maskLayer;
 [self.view addSubview:imageView];

 */
+ (UIImageView *)imgviewWithGraphics:(UIImageView *)imgv {
    UIGraphicsBeginImageContextWithOptions(imgv.bounds.size, NO, 1.0);
    [[UIBezierPath bezierPathWithRoundedRect:imgv.bounds cornerRadius:imgv.frame.size.width]addClip];
    [imgv drawRect:imgv.bounds];
    
    imgv.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imgv;
}
/*
 UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(200, 400, 200, 200)];
 imageView.image = [UIImage imageNamed:@"1"];
 UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, NO, 1.0);
 [[UIBezierPath bezierPathWithRoundedRect:imageView.bounds cornerRadius:imageView.frame.size.width]addClip];
 [imageView drawRect:imageView.bounds];
 
 imageView.image = UIGraphicsGetImageFromCurrentImageContext();
 UIGraphicsEndImageContext();
 [self.view addSubview:imageView];
 */
@end
