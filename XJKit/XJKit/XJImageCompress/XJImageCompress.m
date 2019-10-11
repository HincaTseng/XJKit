//
//  XJImageCompress.m
//  XJKit
//
//  Created by 曾宪杰 on 2019/10/11.
//  Copyright © 2019 曾宪杰. All rights reserved.
//

#import "XJImageCompress.h"

@implementation XJImageCompress

+ (NSData *)compressImage:(UIImage *)sourceImg {
    CGSize imageSize = sourceImg.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    //宽高大于1280
    if (width > 1280 || height > 1280) {
        if (width > height) {
            CGFloat scale = height / width;
            width = 1280;
            height = width * scale;
        } else {
            CGFloat scale = width / height;
            height = 1280;
            width = height * scale;
        }
    }
    //宽大于1280 高小于1280
    else if (width > 1280 || height < 1280) {
        CGFloat scale = width / height;
        height = 1280;
        width = height * scale;
    }
    //宽小于1280 高大于1280
    else if (width < 1280 || height > 1280) {
        CGFloat scale = width / height;
        height = 1280;
        width = height * scale;
    }
    //宽高都小于1280
    else {
        
    }
    
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    [sourceImg drawInRect:CGRectMake(0, 0, width, height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //压缩
    NSData *data = UIImageJPEGRepresentation(newImage, 1.0);
    if (data.length > 100 * 1024) {
        //1M以上
        if (data.length > 1024 * 1024) {
            data = UIImageJPEGRepresentation(newImage, 0.7);
        }
        //
        else if (data.length > 512 * 1024) {
            data = UIImageJPEGRepresentation(newImage, 0.8);
        }
        //
        else if (data.length > 200 * 1024) {
            data = UIImageJPEGRepresentation(newImage, 0.9);
        }
    }
    return data;
    
}
@end
