//
//  NSData+Compress.h
//  test
//
//  Created by 曾宪杰 on 2019/10/12.
//  Copyright © 2019 Hincat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSData (Compress)
+ (NSData *)compressImage:(UIImage *)sourceImg;
@end

NS_ASSUME_NONNULL_END
