//
//  XJNavigationController.m
//  ShallotHelp
//
//  Created by 曾宪杰 on 2017/10/10.
//  Copyright © 2017年 曾宪杰. All rights reserved.
//

#import "XJNavigationController.h"
#define NAVIGATION_HEIGHT (CGRectGetHeight([[UIApplication sharedApplication] statusBarFrame]) + CGRectGetHeight(self.navigationController.navigationBar.frame))
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface XJNavigationController ()

@end

@implementation XJNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.extendedLayoutIncludesOpaqueBars = NO;
    self.navigationBar.translucent = NO;
    
//    ----------
    //    self.modalPresentationCapturesStatusBarAppearance = NO;
    
    //自定义返回按钮
    //    UIImage *backButtonImage = [UIImage imageNamed:@"返回"];
    //    backButtonImage = [backButtonImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, backButtonImage.size.width, 0, 0)];
    //    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    //将返回按钮的文字position设置不在屏幕上显示   “使用该方法，APP间切换时，跳回自己的app会闪动，解决方法：在BaseViewController中去除返回的文字”
    //    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
    
//    if (@available(iOS 11.0, *)) {
//        self.navigationController.navigationBar.prefersLargeTitles = YES;//大标题
//        self.navigationController.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAlways;
//    } else {
//        // Fallback on earlier versions
//    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //隐藏nav底部黑线
//     self.navigationBar.subviews[0].subviews[0].hidden = YES;
#ifdef __IPHONE_11_0
    if (@available(iOS 11.0, *)) {
        //nav上移的话，重新设置高度。
        self.navigationController.navigationBar.frame  = CGRectMake(0, 0, SCREEN_WIDTH, NAVIGATION_HEIGHT);
    }
#endif
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) { // 如果push进来的不是第一个控制器
        // 隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    // 这句super的push要放在后面, 让viewController可以覆盖上面设置的leftBarButtonItem
    // 意思是，我们任然可以重新在push控制器的viewDidLoad方法中设置导航栏的leftBarButtonItem，如果设置了就会覆盖在push方法中设置的“返回”按钮，因为 [super push....]会加载push的控制器执行viewDidLoad方法。
    [super pushViewController:viewController animated:animated];
}

#pragma mark -  set

-(void)settingNavStyle:(NSDictionary *)navConfig {
    NSMutableDictionary *mDic = [[NSMutableDictionary alloc] init];
   
    if (navConfig[@"textColor"]) {
        [mDic setObject:navConfig[@"textColor"] forKey:NSForegroundColorAttributeName];
    } else {
        [mDic setObject:[UIColor blackColor] forKey:NSForegroundColorAttributeName];
    }

    if (navConfig[@"textFont"]) {
        [mDic setObject:navConfig[@"textFont"] forKey:NSFontAttributeName];
    }
    self.navigationBar.titleTextAttributes = mDic;
}

- (void)setSetting:(NSMutableDictionary *)setting {
    _setting = [setting mutableCopy];
    
    //字颜色
    if (setting[@"textColor"]) {
        [setting setObject:setting[@"textColor"] forKey:NSForegroundColorAttributeName];
    } else {
        [setting setObject:[UIColor blackColor] forKey:NSForegroundColorAttributeName];
    }
    //字大小
    if (setting[@"textFont"]) {
        [setting setObject:setting[@"textFont"] forKey:NSFontAttributeName];
    }
    //是否隐藏底部线条
    if ([setting[@"hidenLine"] isEqualToString:@"YES"]) {
        self.navigationBar.shadowImage = [UIImage new];
    }
    //bar颜色
    if (setting[@"barColor"]) {
        self.navigationBar.barTintColor = [setting valueForKey:@"barColor"];
    }
    self.navigationBar.titleTextAttributes = setting;
}
@end
