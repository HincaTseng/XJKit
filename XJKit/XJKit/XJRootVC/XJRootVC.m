//
//  XJRootVC.m
//  XJKit
//
//  Created by 曾宪杰 on 2017/11/22.
//  Copyright © 2017年 曾宪杰. All rights reserved.
//
/*
 如果页面是隐藏导航栏，并且界面是用不是白色的view。push pop 出现 navigationBar 需要
  [self.navigationController setNavigationBarHidden:YES animated:NO];
 下级页面如果有导航栏需要设置为 Hidden NO。。。
 
 */
#import "XJRootVC.h"
#import "XJRunMethodFix.h"

@interface XJRootVC ()

@end

@implementation XJRootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    //适配
    if (@available(iOS 11.0,*)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        UICollectionView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        UITableView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        UITableView.appearance.estimatedRowHeight = 0;
        UITableView.appearance.estimatedSectionHeaderHeight = 0;
        UITableView.appearance.estimatedSectionFooterHeight = 0;
        UITableView.appearance.contentInset = UIEdgeInsetsZero;

    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self navigationBarHiden:YES];
    [self.navigationItem setHidesBackButton:YES];
    [self.navigationController.navigationItem setHidesBackButton:YES];
    [self.navigationController.navigationBar.backItem setHidesBackButton:YES];
  
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationItem setHidesBackButton:NO];
    [self.navigationController.navigationItem setHidesBackButton:NO];
    [self.navigationController.navigationBar.backItem setHidesBackButton:NO];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}

#pragma mark -添加左右导航按钮
- (void)createNavigationBarWithLeftType:(NSString *)leftType andLeftTypeSelected:(NSString *)leftTypeSelected withRightType:(NSString *)rightType andRightTypeSelected:(NSString *)rightTypeSelected withType:(titleOrImage)titleOrImage {
    if (titleOrImage == title) {
        if (leftType) {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0, 0, NavBarTitleWide, NavBarTitleHeigh);
            [button setTitle:leftType forState:UIControlStateNormal];
            [button setTitle:leftTypeSelected forState:UIControlStateSelected];
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            [button addTarget:self action:@selector(leftButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:button];
            self.navigationItem.leftBarButtonItem = item;
        }
        
        if (rightType) {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0, 0, NavBarTitleWide, NavBarTitleHeigh);
            [button setTitle:rightType forState:UIControlStateNormal];
            [button setTitle:rightTypeSelected forState:UIControlStateSelected];
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            [button addTarget:self action:@selector(rightButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:button];
            self.navigationItem.rightBarButtonItem = item;
        }
    } else {
        if (leftType) {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0, 0, NavBarImageWide_left, NavBarImageHeigh_left);
            [button setImage:[UIImage imageNamed:leftType] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:leftTypeSelected] forState:UIControlStateSelected];
            [button addTarget:self action:@selector(leftButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:button];
            self.navigationItem.leftBarButtonItem = item;
            
        }
        
        if (rightType) {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0, 0, NavBarImageWide_right, NavBarImageHeigh_right);
            [button setImage:[UIImage imageNamed:rightType] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:rightTypeSelected] forState:UIControlStateSelected];
            [button addTarget:self action:@selector(rightButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:button];
            self.navigationItem.rightBarButtonItem = item;
        }
    }
}

#pragma mark -创建左导航按钮
- (void)createLeftItem:(NSString *)leftItem andLeftItemSelected:(NSString *)leftItemSelected withType:(titleOrImage)titleOrImage {
    if (leftItem) {
        if (titleOrImage == title) {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0, 0, NavBarTitleWide, NavBarTitleHeigh);
            [button setTitle:leftItem forState:UIControlStateNormal];
            [button setTitle:leftItemSelected forState:UIControlStateSelected];
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            [button addTarget:self action:@selector(leftButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:button];
            self.navigationItem.leftBarButtonItem = item;
        } else {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0, 0, NavBarImageWide_left, NavBarImageHeigh_left);
            [button setBackgroundImage:[UIImage imageNamed:leftItem] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:leftItemSelected] forState:UIControlStateSelected];
            [button addTarget:self action:@selector(leftButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:button];
            self.navigationItem.leftBarButtonItem = item;
        }
    }
}

#pragma mark -创建右导航按钮
- (void)createRightItem:(NSString *)rightItem andRightItemSelected:(NSString *)rightItemSelected withType:(titleOrImage)titleOrImage {
    if (rightItem) {
        if (titleOrImage == title) {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0, 0, NavBarTitleWide, NavBarTitleHeigh);
            [button setTitle:rightItem forState:UIControlStateNormal];
            [button setTitle:rightItemSelected forState:UIControlStateSelected];
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            [button setTitleColor:TitleColor forState:UIControlStateNormal];
            [button addTarget:self action:@selector(rightButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:button];
            self.navigationItem.rightBarButtonItem = item;
        } else {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0, 0, NavBarImageWide_right, NavBarImageHeigh_right);
            [button setBackgroundImage:[UIImage imageNamed:rightItem] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:rightItemSelected] forState:UIControlStateSelected];
            [button addTarget:self action:@selector(rightButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:button];
            self.navigationItem.rightBarButtonItem = item;
        }
    }
}

#pragma mark -左右按钮点击事件
- (void)rightButtonPressed:(UIButton *)button {
    NSLog(@"rightButtonPressed in root");
}

- (void)leftButtonPressed:(UIButton *)button {
    NSLog(@"leftButtonPressed in root");
}

- (void)createBackBarItemWithImage:(NSString *)imageName Title:(NSString *)title {
    UIButton * backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 70, 70)];
    backButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [backButton setTitle:title forState:UIControlStateNormal];
    [backButton setTitleColor:BackTitleColor forState:UIControlStateNormal];
    backButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [backButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

- (void)navigationBarHiden:(BOOL)barHiden {
    self.navigationController.navigationBar.subviews[0].subviews[0].hidden = barHiden;
}

- (void)backBtnClick {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - runtime crash

- (id)forwardingTargetForSelector:(SEL)aSelector {
   
    return [[XJRunMethodFix alloc] init];
    
    return [super forwardingTargetForSelector:aSelector];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
