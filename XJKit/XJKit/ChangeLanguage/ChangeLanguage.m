//
//  ChangeLanguage.m
//  SystemLanuage
//
//  Created by say on 2017/11/15.
//  Copyright © 2017年 say. All rights reserved.
//

#import "ChangeLanguage.h"
#define LocalLanguageKey @"LocalLanguageKey"
@implementation ChangeLanguage
static NSBundle *bundle = nil;
+ ( NSBundle * )bundle {
    return bundle;
}

//首次加载的时候先检测语言是否存在
+ (void)initUserLanguage {
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *currLanguage = [def valueForKey:LocalLanguageKey];
    
    if (!currLanguage) {
        NSArray *preferredLanguages = [NSLocale preferredLanguages];
        currLanguage = preferredLanguages[0];
        if ([currLanguage hasPrefix:@"en"]) {
            currLanguage = @"en";
        } else if ([currLanguage hasPrefix:@"zh"]) {
            currLanguage = @"zh-Hans";
        } else currLanguage = @"en";
        [def setValue:currLanguage forKey:LocalLanguageKey];
        [def synchronize];
    }
    
    //获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:currLanguage ofType:@"lproj"];
    bundle = [NSBundle bundleWithPath:path];//生成bundle
}

//获取当前语言
+ (NSString *)userLanguage {
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *language = [def valueForKey:LocalLanguageKey];
    
    return language;
}

//设置语言
+ (void)setUserlanguage:(NSString *)language {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *currLanguage = [userDefaults valueForKey:LocalLanguageKey];
    if ([currLanguage isEqualToString:language]) {
        return;
    }
    [userDefaults setValue:language forKey:LocalLanguageKey];
    [userDefaults synchronize];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj" ];
    bundle = [NSBundle bundleWithPath:path];
}

//获取当前文字
+ (NSString *)titleStringForKey:(NSString *)key {
    return [bundle localizedStringForKey:key value:nil table:@"English"];;
}
@end
