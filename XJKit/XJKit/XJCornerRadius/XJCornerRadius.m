//
//  XJCornerRadius.m
//  XJKit
//
//  Created by 曾宪杰 on 2018/8/16.
//  Copyright © 2018年 曾宪杰. All rights reserved.
//

#import "XJCornerRadius.h"

@implementation XJCornerRadius


+ (void)pathShape:(UIView *)view size:(CGFloat)size {
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectEdgeTop | UIRectEdgeLeft |UIRectEdgeRight |UIRectEdgeBottom cornerRadii:CGSizeMake(size, size)];
    CAShapeLayer * makeLayer = [CAShapeLayer layer];
    makeLayer.frame = view.bounds;
    makeLayer.path = path.CGPath;
    view.layer.mask = makeLayer;
    
}


@end
