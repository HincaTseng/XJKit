//
//  NSNull+JSON.h
//  XJKit
//
//  Created by 曾宪杰 on 2018/7/27.
//  Copyright © 2018年 曾宪杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNull (JSON)
- (NSUInteger)length;
- (NSInteger)integerValue;
- (float)floatValue;
- (NSString *)description;
- (NSArray *)componentsSeparatedByString:(NSString *)separator;
- (id)objectForKey:(id)key;
- (BOOL)boolValue;
- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)aSet;

@end
