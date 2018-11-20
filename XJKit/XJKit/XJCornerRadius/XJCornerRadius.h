//
//  XJCornerRadius.h
//  XJKit
//
//  Created by 曾宪杰 on 2018/8/16.
//  Copyright © 2018年 曾宪杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XJCornerRadius : NSObject

/**
 圆角
 
 @param view 要添加圆角的view
 @param size 大小
 */
+ (void)pathShape:(UIView *)view size:(CGFloat)size;

@end
