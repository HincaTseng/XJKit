//
//  UITextField+XJPlaceHolderColor.m
//  XJKit
//
//  Created by 曾宪杰 on 2018/3/31.
//  Copyright © 2018年 曾宪杰. All rights reserved.
//

#import "UITextField+XJPlaceHolderColor.h"

XJCategory_DUMMY_CLASS(UITextField_XJPlaceHolderColor)

@implementation UITextField (XJPlaceHolderColor)
- (void)placeHolderColor:(UIColor *) color for:(UITextField *)textField withText:(NSString *)text {
    NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc] initWithString:text];
    [placeholder addAttribute:NSForegroundColorAttributeName
                        value:color
                        range:NSMakeRange(0, text.length)];
    textField.attributedPlaceholder = placeholder;
}
@end
