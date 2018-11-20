//
//  UIView+XJViewNewXIB.m
//  
//
//  Created by 曾宪杰 on 2017/11/30.
//  Copyright © 2017年 曾宪杰 All rights reserved.
//

#import "UIView+XJViewNewXIB.h"

XJCategory_DUMMY_CLASS(UIView_XJViewNewXIB)

@implementation UIView (XJViewNewXIB)
- (void)viewNewXIB:(UIView *)xibName {
    [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([xibName class]) owner:self options:nil];
}
@end
