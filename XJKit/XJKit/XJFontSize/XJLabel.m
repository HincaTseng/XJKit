//
//  XJLabel.m
//  ShallotHelp
//
//  Created by 曾宪杰 on 2017/10/20.
//  Copyright © 2017年 曾宪杰. All rights reserved.
//

#import "XJLabel.h"
#import "XJFontSize.h"
@implementation XJLabel

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [super setFont:[XJFontSize xjFontSize:self.font]];
}

- (void)setFont:(UIFont *)font {
    [super setFont:[XJFontSize xjFontSize:font]];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
}

@end
