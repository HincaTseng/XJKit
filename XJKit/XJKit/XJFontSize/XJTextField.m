//
//  XJTextField.m
//  ShallotHelp
//
//  Created by 曾宪杰 on 2017/10/20.
//  Copyright © 2017年 曾宪杰. All rights reserved.
//

#import "XJTextField.h"
#import "XJFontSize.h"
@implementation XJTextField

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

//fix iOS 11.2 点击出现输入框，内存泄露。但还是走dealloc了。
- (void)didMoveToWindow {
    [super didMoveToWindow];
    
    if (@available(iOS 11.2,*)) {
        NSString *keyPath = @"textContentView.provider";
        @try {
            if (self.window) {
                id provider = [self valueForKeyPath:keyPath];
                if (!provider && self) {
                    [self setValue:self forKeyPath:keyPath];
                }
            } else {
                [self setValue:nil forKeyPath:keyPath];
            }
        } @catch (NSException *exception) {
            NSLog(@"%@",exception);
        }
    }
}


@end
