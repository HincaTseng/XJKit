//
//  XJElasticVC.m
//  XJKit
//
//  Created by 曾宪杰 on 2017/7/25.
//  Copyright © 2017年 曾宪杰. All rights reserved.
//

#import "XJElasticVC.h"

typedef void(^myBlock) (void);
@interface XJElasticVC ()
{
    UIViewController * fromVC;
}
@property (nonatomic,assign) XJAnimationModelType modelType;
@property (nonatomic,assign) CGFloat duration;
@property (nonatomic,assign) CGFloat height;
@end

@implementation XJElasticVC

- (instancetype)init {
    if (self = [super init]) {
        if (!self.currDuration) {
            self.currDuration = 0.5;
        } else {
            self.duration = self.currDuration;
        }
    }
    return self;
}

-(NSTimeInterval) transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return self.duration;
}

+ (XJElasticVC *)animModelWithModelTyoe:(XJAnimationModelType)modelType withHeight:(CGFloat)height {
    XJElasticVC *model = [[XJElasticVC alloc]init];
    model.modelType = modelType;
    model.height = height;
    return model;
}

- (void) animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    if (self.modelType == XJAnimationModelTypePresent) {
        [self present:transitionContext];
    } else {
        [self dismiss:transitionContext];
    }
}


- (void)dismiss:(id<UIViewControllerContextTransitioning>) transitionContext {
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView * containerView = [transitionContext containerView];
    UIView * toView = containerView.subviews.firstObject;
    
    [containerView addSubview:toView];
    [containerView addSubview:fromView];
    
    fromView.frame = CGRectMake(0, containerView.frame.size.height - self.height, containerView.frame.size.width,self.height);
    //
    CATransform3D transform3D = CATransform3DIdentity;
    transform3D.m34 = 1.0/-900;
    transform3D = CATransform3DScale(transform3D, 0.95, 0.95, 1);
    
    CATransform3D trans = CATransform3DIdentity;
    trans.m34 = transform3D.m34;
    trans = CATransform3DRotate(trans, 0, 1, 0, 0);
    trans = CATransform3DScale(trans, 1, 1, 1);
    trans = CATransform3DTranslate(trans, 0, 0, 0);
    //
    [UIView animateWithDuration:self.duration animations:^{
        
        fromView.frame = CGRectMake(0, containerView.frame.size.height, containerView.frame.size.width, self.height);
        
    }completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
        
        [transitionContext viewForKey:UITransitionContextToViewKey].hidden = NO;
        [toView removeFromSuperview];
        
    }];
    
    [UIView animateWithDuration:self.duration/2 animations:^{
        
        toView.layer.transform = transform3D;
        toView.alpha = 1;
    }completion:^(BOOL finished) {
        
        [UIView animateWithDuration:self.duration/2 animations:^{
            
            toView.layer.transform = trans;
            
        }];
        
    }];

}


- (void)present:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *containerView = [transitionContext containerView];
    fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIImageView *fromViewTemp = [self imageFromView:fromView];
    fromView.hidden = YES;
    
    [containerView addSubview:fromViewTemp];
    [containerView addSubview:toView];
    
    toView.frame = CGRectMake(0, containerView.frame.size.height, containerView.frame.size.width, self.height);
    fromViewTemp.frame = containerView.frame;
    
    
    CATransform3D transform3D = CATransform3DIdentity;
    transform3D.m34 = 1.0/-4000;
    transform3D = CATransform3DScale(transform3D, 0.95, 0.95, 1);
    transform3D = CATransform3DRotate(transform3D, 15*M_PI/180.0f, 1, 0, 0);
    
    CATransform3D transform3d = CATransform3DIdentity;
    transform3d.m34 = transform3D.m34;
    transform3d = CATransform3DTranslate(transform3d, 0, -0.08*containerView.frame.size.height, 0);
    transform3d = CATransform3DScale(transform3d, 0.9, 0.9, 1);
    
    fromViewTemp.layer.anchorPoint = CGPointMake(0.5, 1);
    fromViewTemp.layer.position = CGPointMake(CGRectGetMidX(containerView.frame), CGRectGetMaxY(containerView.frame));
    fromViewTemp.layer.shouldRasterize = YES;
    
    
    fromViewTemp.layer.anchorPoint = CGPointMake(0.5, 1);
    fromViewTemp.layer.position = CGPointMake(CGRectGetMidX(containerView.frame), CGRectGetMaxY(containerView.frame));
    
    
    
    [UIView animateWithDuration:self.duration animations:^{
        containerView.backgroundColor = [UIColor blackColor];
        toView.frame = CGRectMake(0, containerView.frame.size.height-self.height, containerView.frame.size.width, self.height);
        
    }completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
        
    }];
    
    [UIView animateWithDuration:self.duration/2 animations:^{
        
        fromViewTemp.layer.transform = transform3D;
        fromViewTemp.alpha = 0.6;
    }completion:^(BOOL finished) {
        
        [UIView animateWithDuration:self.duration/2 animations:^{
            
            fromViewTemp.layer.transform = transform3d;
            
        }];
        
    }];
    
}


// 截屏
- (UIImageView*)imageFromView:(UIView *)snapView{
    
    UIGraphicsBeginImageContextWithOptions(snapView.frame.size, NO, 0.0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [snapView.layer renderInContext:context];
    
    UIImage*targetImage =UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:targetImage];
    
    imageView.frame= snapView.frame;
    
    return imageView;
    
}







@end
