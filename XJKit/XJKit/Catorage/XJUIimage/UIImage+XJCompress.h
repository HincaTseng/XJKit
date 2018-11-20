//
//  UIImage+XJCompress.h
//  Wallet
//
//  Created by 曾宪杰 on 2018/5/16.
//  Copyright © 2018年 rf_ios_dev1. All rights reserved.
//

#import <UIKit/UIKit.h>
//NSData *data = [self.bankCarkImageView.image compressWithLengthLimit:200.0f * 1024.0f];
//NSString *type = [CommonFuction imageFormat:self.bankCarkImageView.image];

@interface UIImage (XJCompress)
/*
 *  压缩图片方法(先压缩质量再压缩尺寸)
 */
-(NSData *)compressWithLengthLimit:(NSUInteger)maxLength;
/*
 *  压缩图片方法(压缩质量)
 */
-(NSData *)compressQualityWithLengthLimit:(NSInteger)maxLength;
/*
 *  压缩图片方法(压缩质量二分法)
 */
-(NSData *)compressMidQualityWithLengthLimit:(NSInteger)maxLength;
/*
 *  压缩图片方法(压缩尺寸)
 */
-(NSData *)compressBySizeWithLengthLimit:(NSUInteger)maxLength;
@end
