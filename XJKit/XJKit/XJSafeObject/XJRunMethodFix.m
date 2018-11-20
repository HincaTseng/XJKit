//
//  XJRunMethodFix.m
//  XJKit
//
//  Created by 曾宪杰 on 2018/10/13.
//  Copyright © 2018 曾宪杰. All rights reserved.
//

#import "XJRunMethodFix.h"
#import <objc/runtime.h>

@implementation XJRunMethodFix
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
    NSLog(@"Carsh SEL is %@\n",NSStringFromSelector(sel));
    
    class_addMethod(self, sel, (IMP)fix, "v@:");
    return YES;
    
    return [super resolveInstanceMethod:sel];
}

void fix (id self) {
    NSLog(@"\n%@ 执行的方法出现崩溃...\n",[self class]);
}
@end
