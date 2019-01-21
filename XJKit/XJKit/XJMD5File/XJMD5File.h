//
//  XJMD5File.h
//  XJKit
//
//  Created by 曾宪杰 on 2019/1/21.
//  Copyright © 2019 曾宪杰. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XJMD5File : NSObject

- (void)calculateFileMd5WithFilePath:(NSString *)filePath completion:(void (^)(NSString *fileMD5))completion;

@end

NS_ASSUME_NONNULL_END
