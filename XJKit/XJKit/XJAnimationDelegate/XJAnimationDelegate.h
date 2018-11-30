//
//  XJAnimationDelegate.h
//  XJKit
//
//  Created by 曾宪杰 on 2018/11/30.
//  Copyright © 2018 曾宪杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

/*
* 使用这个类中的XJAnimDelegate。。
* CAAnimation.XJAnimDelegate = self;
*/

NS_ASSUME_NONNULL_BEGIN
@protocol XJAnimDelegate <NSObject>

@optional
- (void)animationDidStop:(CAAnimation*)anim;

@end
@interface XJAnimationDelegate : CABasicAnimation <CAAnimationDelegate>
@property (nonatomic,weak) id<XJAnimDelegate>anmiDelegate;

@end

NS_ASSUME_NONNULL_END
