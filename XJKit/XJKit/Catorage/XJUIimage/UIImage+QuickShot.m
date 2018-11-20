//
//  UIImage+QuickShot.m
//  
//
//  Created by 曾宪杰 on 2018/8/6.
//  Copyright © 2018年 zengxianjie. All rights reserved.
//

#import "UIImage+QuickShot.h"

XJCategory_DUMMY_CLASS(UIImage_QuickShot)

@implementation UIImage (QuickShot)
+ (UIImage *)quickShot {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIGraphicsBeginImageContext(window.bounds.size);
    if ( [window respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)] ) {
        [window drawViewHierarchyInRect:window.bounds afterScreenUpdates:YES];
    } else{
        [window.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData *imgData = UIImageJPEGRepresentation(img, 0.8);
    img = [UIImage imageWithData:imgData];
    return img;
}
@end
