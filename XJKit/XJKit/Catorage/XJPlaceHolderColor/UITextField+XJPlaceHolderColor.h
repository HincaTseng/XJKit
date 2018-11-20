//
//  UITextField+XJPlaceHolderColor.h
//  XJKit
//
//  Created by 曾宪杰 on 2018/3/31.
//  Copyright © 2018年 曾宪杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (XJPlaceHolderColor)
- (void)placeHolderColor:(UIColor *) color for:(UITextField *)textField withText:(NSString *)text;
@end
