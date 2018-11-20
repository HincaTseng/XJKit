//
//  XJConstraintEqualToConstant.h
//  XJKit
//
//  Created by 曾宪杰 on 2018/7/6.
//  Copyright © 2018年 曾宪杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJConstraintEqualToConstant : NSObject

/**
 通过对按钮的宽度和高度进行约束来控制图标的大小。
 0表示不约束。

 @param someThing 要改的控件
 @param width 宽
 @param height 高
 */
- (void)xjChangeAnchorThing:(UIView *)someThing Width:(CGFloat)width Height:(CGFloat)height;

@end
