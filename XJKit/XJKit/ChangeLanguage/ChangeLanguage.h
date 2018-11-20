//
//  ChangeLanguage.h
//  SystemLanuage
//
//  Created by say on 2017/11/15.
//  Copyright © 2017年 say. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChangeLanguage : NSObject
+ (NSBundle *)bundle;//获取当前资源文件
+ (void)initUserLanguage;//初始化语言文件
+ (NSString *)userLanguage;//获取应用当前语言
+ (void)setUserlanguage:(NSString *)language;//设置当前语言
+ (NSString *)titleStringForKey:(NSString *)key;//获取对用文字
@end
