//
//  XJTopView.h
//  SuperShidle
//
//  Created by 曾宪杰 on 2018/7/7.
//  Copyright © 2018年 zengxianjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XJSearchBar.h"
@protocol XJSearchJumpDelegate<NSObject>
- (void)xjSearchButtonClicked:(UISearchBar *)bar text:(NSString *)info;
- (void)xjSearchCancelButtonClicked:(UISearchBar *)bar;
- (void)xjSearchInfoClick:(NSInteger)ind;

@end

@interface XJTopView : UIView<UISearchBarDelegate>

@property (strong, nonatomic) IBOutlet UIView *ContentView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet XJSearchBar *xjSearchBar;
@property (weak, nonatomic) IBOutlet UIButton *backGImageView;
@property (nonatomic,weak) id <XJSearchJumpDelegate> searchDelegate;
@property (weak, nonatomic) IBOutlet UIView *viewOne;

@end
