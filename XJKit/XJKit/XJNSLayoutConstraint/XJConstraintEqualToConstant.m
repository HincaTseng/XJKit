//
//  XJConstraintEqualToConstant.m
//  XJKit
//
//  Created by 曾宪杰 on 2018/7/6.
//  Copyright © 2018年 曾宪杰. All rights reserved.
//

#import "XJConstraintEqualToConstant.h"

@implementation XJConstraintEqualToConstant

- (void)xjChangeAnchorThing:(UIView *)someThing Width:(CGFloat)width Height:(CGFloat)height {
    if (width > 0) {
        NSLayoutConstraint *constraintW = [someThing.widthAnchor constraintEqualToConstant:width];
        constraintW.active = YES;
    }
    if (height > 0) {
        NSLayoutConstraint *constraintH = [someThing.heightAnchor constraintEqualToConstant:height];
        constraintH.active = YES;
    }
}

@end
