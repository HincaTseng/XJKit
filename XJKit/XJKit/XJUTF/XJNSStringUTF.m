//
//  XJNSStringUTF.m
//  XJKit
//
//  Created by 曾宪杰 on 2018/9/25.
//  Copyright © 2018年 曾宪杰. All rights reserved.
//

#import "XJNSStringUTF.h"

@implementation XJNSStringUTF

+(NSString *)XJstringWithUtf8:(NSString *)obj {

    return [obj stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}
@end
