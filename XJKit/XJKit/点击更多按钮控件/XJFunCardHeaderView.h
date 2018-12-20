//
//  XJFunCardHeaderView.h
//  Wallet
//
//  Created by 曾宪杰 on 2018/4/14.
//  Copyright © 2018年 rf_ios_dev1. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol XJFunCardHeaderViewDelegate<NSObject>
- (void)xjFunCardHeaderViewDidSelect;
@end

@interface XJFunCardHeaderView : UIView
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UIButton *moreBtn;
@property (nonatomic,weak) id<XJFunCardHeaderViewDelegate> delegate;

@end
