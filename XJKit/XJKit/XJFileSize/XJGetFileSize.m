//
//  XJGetFileSize.m
//  XJKit
//
//  Created by 曾宪杰 on 2019/1/21.
//  Copyright © 2019 曾宪杰. All rights reserved.
//

#import "XJGetFileSize.h"

@implementation XJGetFileSize

+ (NSInteger)fileSizeWithPath:(NSString *)path {
    NSInteger fileLength = 0;
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    if ([fileManager fileExistsAtPath:path]) {
        NSError *error = nil;
        NSDictionary *dic = [fileManager attributesOfItemAtPath:path error:&error];
        if (!error && dic) {
            fileLength = [dic fileSize];
        }
    }
    return fileLength;
}

@end
