//
//  XJRootVC.h
//  XJKit
//
//  Created by 曾宪杰 on 2017/11/22.
//  Copyright © 2017年 曾宪杰. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    title,
    image
}titleOrImage;

@interface XJRootVC : UIViewController

/**
    set YES for your VC ,before the [super viewWillAppear]
 */
@property (nonatomic,assign) BOOL barHiden;//是否隐藏导航栏下划线
@property (nonatomic,assign) BOOL statusBar;
@property (nonatomic,copy) NSString * backStr;//返回按钮字体名称
//创建导航按钮
- (void)createNavigationBarWithLeftType:(NSString *)leftType andLeftTypeSelected:(NSString *)leftTypeSelected withRightType:(NSString *)rightType andRightTypeSelected:(NSString *)rightTypeSelected withType:(titleOrImage)titleOrImage;
//创建左导航栏按钮
- (void)createLeftItem:(NSString *)leftItem andLeftItemSelected:(NSString *)leftItemSelected withType:(titleOrImage)titleOrImage;
//创建右导航栏按钮
- (void)createRightItem:(NSString *)rightItem andRightItemSelected:(NSString *)rightItemSelected withType:(titleOrImage)titleOrImage;
//左右导航按键点击事件
- (void)rightButtonPressed:(UIButton *)button;
- (void)leftButtonPressed:(UIButton *)button;
//返回按键
- (void)createBackBarItemWithImage:(NSString *)imageName Title:(NSString *)title;


@end
