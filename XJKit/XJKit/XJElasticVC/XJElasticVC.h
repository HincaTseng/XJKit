//
//  XJElasticVC.h
//  XJKit
//
//  Created by 曾宪杰 on 2017/7/25.
//  Copyright © 2017年 曾宪杰. All rights reserved.
//  弹出视图

/*- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return [XJElasticVC animModelWithModelTyoe:XJAnimationModelTypePresent height:300];
    
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    return [XJElasticVC animModelWithModelTyoe:XJAnimationModelTypeDismiss height:300];
}
*/
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger,XJAnimationModelType) {
    XJAnimationModelTypePresent,
    XJAnimationModelTypeDismiss
};
@interface XJElasticVC : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic,assign) CGFloat currDuration; //defaulf is 0.5

+ (XJElasticVC *)animModelWithModelTyoe:(XJAnimationModelType)modelType withHeight:(CGFloat)height;

@end
