//
//  UIViewController+Type.m
//  BabyPay
//
//  Created by 曾宪杰 on 2017/11/28.
//  Copyright © 2017年 曾宪杰 All rights reserved.
//

#import "UIViewController+Type.h"
#import <objc/runtime.h>
static char *strType = "strType";

XJCategory_DUMMY_CLASS(UIViewController_Type)

@implementation UIViewController (Type)

-(NSString *)myType {
    return objc_getAssociatedObject(self, strType);
}

-(void)setMyType:(NSString *)myType {
    objc_setAssociatedObject(self, strType, myType, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
