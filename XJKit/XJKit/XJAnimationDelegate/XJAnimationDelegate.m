//
//  XJAnimationDelegate.m
//  XJKit
//
//  Created by 曾宪杰 on 2018/11/30.
//  Copyright © 2018 曾宪杰. All rights reserved.
//

#import "XJAnimationDelegate.h"

@implementation XJAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (self.anmiDelegate && [self.anmiDelegate respondsToSelector:@selector(animationDidStop:)]) {
        [self.anmiDelegate animationDidStop:anim];
    }
}

//重写delegate 把UIKit的变成XJAnimationDelegate的~~~
- (void)setAnmiDelegate:(id<XJAnimDelegate>)anmiDelegate {
    _anmiDelegate = self.anmiDelegate;
    self.delegate = self;
}

- (void)dealloc {
    NSLog(@"%s",__func__);
    
}
@end
