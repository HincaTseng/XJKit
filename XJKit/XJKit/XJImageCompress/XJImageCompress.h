//
//  XJImageCompress.h
//  XJKit
//
//  Created by 曾宪杰 on 2019/10/11.
//  Copyright © 2019 曾宪杰. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XJImageCompress : NSData
+ (NSData *)compressImage:(UIImage *)sourceImg;

@end

NS_ASSUME_NONNULL_END
