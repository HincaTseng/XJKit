//
//  XJFunCardHeaderView.m
//  Wallet
//
//  Created by 曾宪杰 on 2018/4/14.
//  Copyright © 2018年 rf_ios_dev1. All rights reserved.
//

#import "XJFunCardHeaderView.h"

@implementation XJFunCardHeaderView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [[NSBundle mainBundle] loadNibNamed:@"XJFunCardHeaderView" owner:self options:nil];
        [self addSubview:self.contentView];
        
    }
    return self;
}

//点击
- (IBAction)moreBtnSelect:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(xjFunCardHeaderViewDidSelect)]) {
        [self.delegate xjFunCardHeaderViewDidSelect];
    }
}

- (void)drawRect:(CGRect)rect {
    self.contentView.frame = rect;
}


@end
