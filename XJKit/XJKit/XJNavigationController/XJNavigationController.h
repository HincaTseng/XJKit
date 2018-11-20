//
//  XJNavigationController.h
//  ShallotHelp
//
//  Created by 曾宪杰 on 2017/10/10.
//  Copyright © 2017年  曾宪杰. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XJNavigationController : UINavigationController

/**
 配置nav样式 2.0
  @{
        @"textColor":[UIColor blueColor], //默认黑色
        @"textFont":[UIFont systemFontOfSize:17]
    };
 @param navConfig 传入字典参数
 */
- (void)settingNavStyle:(NSDictionary *)navConfig UI_APPEARANCE_SELECTOR DEPRECATED_MSG_ATTRIBUTE("Use property setting") ;


/**
 用属性的方式传至。
 
 testColor 字体颜色
 barColor barTintColor 颜色
 textFont 字体大小
 hidenLine 是否隐藏下划线 默认NO
 
 NSMutableDictionary *dics = [[NSMutableDictionary alloc] init];
 [dics setObject:@"YES" forKey:@"hidenLine"];
 [dics setObject:[UIColor redColor] forKey:@"textColor"];
 [dics setObject:[UIFont systemFontOfSize:14] forKey:@"textFont"];
 [dics setObject:[UIColor cyanColor] forKey:@"barColor"];
 nav.setting = dics;
 
 */
@property (nonnull,nonatomic,strong) NSMutableDictionary *setting;

@end

NS_ASSUME_NONNULL_END
