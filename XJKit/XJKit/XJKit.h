//
//  XJKit.h
//  XJKit
//
//  Created by 曾宪杰 on 2017/11/16.
//  Copyright © 2017年 曾宪杰. All rights reserved.
//

#import <UIKit/UIKit.h>


//! Project version number for XJKit.
FOUNDATION_EXPORT double XJKitVersionNumber;

//! Project version string for XJKit.
FOUNDATION_EXPORT const unsigned char XJKitVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <XJKit/PublicHeader.h>

#ifdef __OBJC__
#pragma mark -- 基本框架
#pragma mark 导航栏 '适配iOS 11'
#import <XJKit/XJNavigationController.h>
#pragma mark  语言
#import <XJKit/ChangeLanguage.h>

#pragma mark 父VC
#import <XJKit/XJRootVC.h>
#pragma mark GCD多线程任务
#import <XJKit/XJGCD_Multithread.h>
#pragma mark 日期选择
#import <XJKit/XMTimePickerView.h>
#pragma mark 选择拍照或本地照片
#import <XJKit/OpenCameraOrPhoto.h>
#pragma mark string 转utf-8
#import <XJKit/XJNSStringUTF.h>

#pragma mark - AFNetworking 解决内存泄漏问题
#import <XJKit/XJAFSubManager.h>

#pragma mark -- Catorage
#pragma mark 类型传值
#import <XJKit/UIViewController+Type.h>
#pragma mark view
#import <XJKit/UIView+Extension.h>
#pragma mark 日期转换
#import <XJKit/NSDate+Extension.h>
#pragma mark UITextField
#import <XJKit/UITextField+XJPlaceHolderColor.h>
#pragma mark UIView 圆角 非Catorage
#import <XJKit/XJCornerRadius.h>
#pragma mark 圆角图片
#import <XJKit/UIImage+ImageRoundedCorner.h>
#pragma mark 圆形图片
#import <XJKit/UIImage+XJBlur.h>
#pragma mark 高斯模糊
#import <XJKit/UIImage+GaussianBlur.h>
#pragma mark 屏幕快照
#import <XJKit/UIImage+QuickShot.h>
#pragma mark 压缩图片
#import <XJKit/UIImage+XJCompress.h>
#pragma mark 正确的图片方向
#import <XJKit/UIImage+XJOrientation.h>
#pragma mark 相机image工具
#import <XJKit/UIImage+XJCameraTools.h>
#pragma mark UIColor Hex
#import  <XJKit/UIColor+XJHex.h>
#pragma mark MAC地址
#import <XJKit/XJMacAddress.h>
#pragma mark 工具类
#import <XJKit/CommonFuction.h>
#pragma mark URL Scheme跳转app
#import <XJKit/XJURLSchemeOpen.h>
#pragma mark NSLayoutConstraint
#import <XJKit/XJConstraintEqualToConstant.h>
#pragma mark 获取某个类的属性和方法
#import <XJKit/ShowPropertyFunc.h>


#endif

/*
 电量栏 AppDelegate：
     application.statusBarStyle = UIStatusBarStyleLightContent;
 VC：
- (void)setStatusBarBackgroundColor:(UIColor *)color {
     UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
     if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
     statusBar.backgroundColor = color;
     }
 }

 */

/*
 Bitcode NO
 
 外部工程
 @require
 1.Valid Architectures  arm64
 
 @option
 1.Defines Module YES，
 2.Building Settings ->搜索implicit retain of 'self' 设置为 NO
 
 */
