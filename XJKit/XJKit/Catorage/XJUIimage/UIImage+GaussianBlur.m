//
//  UIImage+GaussianBlur.m
//  
//
//  Created by 曾宪杰 on 2018/8/6.
//  Copyright © 2018年 zengxianjie. All rights reserved.
//

#import "UIImage+GaussianBlur.h"
#import <Accelerate/Accelerate.h>

XJCategory_DUMMY_CLASS(UIImage_GaussianBlur)

@implementation UIImage (GaussianBlur)

+ (UIImage *)vGaussianBlurImage:(UIImage *)img blurApl:(CGFloat)apl {
    if (!img) {
        NSLog(@"vGaussianBlurImage 没找到img");
        return nil;
    }
    if ( apl < 0.5 ) {
        apl = 0.5;
    } else if ( apl > 1.0 ){
        apl = 1.0;
    }
    //
    int  boxSize = (int)(apl * 100);
    boxSize -= (boxSize % 2) + 1;
    CGImageRef im = img.CGImage;
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    
    void *pixBuffer;
    CGDataProviderRef inProvider = CGImageGetDataProvider(im);
    //bitmap
    CFDataRef inDataRef = CGDataProviderCopyData(inProvider);
    inBuffer.width = CGImageGetWidth(im);
    inBuffer.height = CGImageGetHeight(im);
    inBuffer.rowBytes = CGImageGetBytesPerRow(im);
    inBuffer.data  = (void *)CFDataGetBytePtr(inDataRef);
    
    pixBuffer = malloc(CGImageGetBytesPerRow(im) * CGImageGetHeight(im));
    outBuffer.width = CGImageGetWidth(im);
    outBuffer.height = CGImageGetHeight(im);
    outBuffer.data = pixBuffer;
    outBuffer.rowBytes = CGImageGetBytesPerRow(im);
    
    void *pixBuffer2 = malloc(CGImageGetBytesPerRow(im) * CGImageGetHeight(im));
    vImage_Buffer outBuffer2;
    outBuffer2.width = CGImageGetWidth(im);
    outBuffer2.height = CGImageGetHeight(im);
    outBuffer2.rowBytes = CGImageGetBytesPerRow(im);
    outBuffer2.data = pixBuffer2;
    
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer2, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    error = vImageBoxConvolve_ARGB8888(&outBuffer2, &inBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    if (error) {
        NSLog(@"error vGaussianBlurImage %ld",error);
    }
    
    CGColorSpaceRef colorRef = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(outBuffer.data, outBuffer.width, outBuffer.height, 8, outBuffer.rowBytes, colorRef, CGImageGetBitmapInfo(img.CGImage));
    
    CGImageRef imaRef = CGBitmapContextCreateImage(ctx);
    UIImage * returnImg = [UIImage imageWithCGImage:imaRef];
    
    //delloc
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorRef);
    free(pixBuffer);
    free(pixBuffer2);
    CFRelease(inDataRef);
    CGImageRelease(imaRef);
    

    return returnImg;
}
@end
