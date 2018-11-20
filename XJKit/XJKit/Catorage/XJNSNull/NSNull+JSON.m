//
//  NSNull+JSON.m
//  XJKit
//
//  Created by 曾宪杰 on 2018/7/27.
//  Copyright © 2018年 曾宪杰. All rights reserved.
//

#import "NSNull+JSON.h"

@implementation NSNull (JSON)
- (NSUInteger)length { return 0; }

- (NSInteger)integerValue { return 0; };

- (float)floatValue { return 0; };

- (NSString *)description { return @"0(NSNull)"; }

- (NSArray *)componentsSeparatedByString:(NSString *)separator {return @[]; }

- (id)objectForKey:(id)key { return nil; }

- (BOOL)boolValue { return NO; }

- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)aSet{
    NSRange nullRange = {NSNotFound, 0};
    return nullRange;
}

@end
