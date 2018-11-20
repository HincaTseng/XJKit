//
//  UIColor+XJHex.h
//  XJKit
//
//  Created by 曾宪杰 on 2018/3/31.
//  Copyright © 2018年 曾宪杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (XJHex)
// 透明度固定为1，以0x开头的十六进制转换成的颜色
+ (UIColor *)colorWithHex:(long)hexColor;
// 0x开头的十六进制转换成的颜色,透明度可调整
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity;
// 颜色转换三：iOS中十六进制的颜色（以#开头）转换为UIColor
+ (UIColor *) colorWithHexString: (NSString *)color;

@end
