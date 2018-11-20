//
//  XJFontSize.m
//  ShallotHelp
//
//  Created by 曾宪杰 on 2017/10/23.
//  Copyright © 2017年 曾宪杰. All rights reserved.
//

#import "XJFontSize.h"

@implementation XJFontSize

+ (UIFont *)xjFontSize:(UIFont *)font {
    UIFont * newFont = nil;
    if (IS_IPHONE_6) {
        newFont = [UIFont fontWithName:font.fontName size:font.pointSize + IPHONE6_INCREMENT];
    }else if (IS_IPHONE_6_PLUS) {
        newFont = [UIFont fontWithName:font.fontName size:font.pointSize + IPHONE6PLUS_INCREMENT];
    } else {
        newFont = font;
    }
    return newFont;
}
@end
