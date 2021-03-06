//
//  XJTextView.m
//  ShallotHelp
//
//  Created by 曾宪杰 on 2017/10/20.
//  Copyright © 2017年 曾宪杰. All rights reserved.
//

#import "XJTextView.h"
#import "XJFontSize.h"
@implementation XJTextView
- (void)awakeFromNib {
    [super awakeFromNib];
    [self setFont:[XJFontSize xjFontSize:self.font]];
}

- (void)setFont:(UIFont *)font {
    [super setFont:[XJFontSize xjFontSize:font]];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
}

@end
