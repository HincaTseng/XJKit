//
//  UIImage+ImageRoundedCorner.h
//  XJKit
//
//  Created by 曾宪杰 on 2018/7/18.
//  Copyright © 2018年 曾宪杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageRoundedCorner)

- (UIImage *)imageAddCornerWithRadius:(CGFloat)radius andSize:(CGSize)size;

+ (UIImageView *)imgviewWithLayer:(UIImageView *)imgv;

+ (UIImageView *)imgviewWithGraphics:(UIImageView *)imgv;

@end
