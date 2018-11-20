//
//  NSDate+SL.h
//
//  Created by apple on 14-5-9.
//  Copyright (c) 2014年 seven All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, DateFormat) {
    DateFormat_yyyyMMdd = 0, // 2015-04-23
    DateFormat_MMdd, // 04-23
    DateFormat_yyyyMMddHHmmss // 2015-04-23 09:10:10
};

@interface NSDate (Extension)

#pragma mark - 时间判断
/**
 *  是否为今天
 */
- (BOOL)isToday;
/**
 *  是否为昨天
 */
- (BOOL)isYesterday;
/**
 *  是否为今年
 */
- (BOOL)isThisYear;

#pragma mark - 时间计算
/**
 *  返回一个只有年月日的时间
 */
- (NSDate *)dateWithYMD;
/**
 *  返回一个只有时间的字符串
 */
- (NSString *)dateWithHHssString;
/**
 *  返回一个只有年月日的时间的字符串
 */
- (NSString *)dateWithYMDString;
/**
 *  获得与当前时间的差距
 */
- (NSDateComponents *)deltaWithNow;
/**
 *  返回当前时间所在月的天数
 *
 *  @return 返回当前时间所在月的天数
 */
+ (NSInteger)daysOfMonthInCurrentDate;

#pragma mark - 时间转换
/**
 *  根据一个1970时间戳返回时间字符串
 *
 *  @param date1970Str 时间戳
 *  @param DateFormat  日期/时间格式
 *
 *  @return 时间字符串
 */

+ (NSString *)timeWithTimeStamp:(NSString *)timeStamp;
/**
 *  根据一个1970时间戳返回时间字符串
 *
 *  @param date1970Str 时间戳
 *  @param DateFormat  日期/时间格式
 *
 *  @return 时间字符串
 */
+ (NSString *)dateWithTimeIntervalSince1970:(NSTimeInterval)date1970Str dateFormat:(DateFormat)DateFormat;

/**
 *  时间戳转英文格式日期(传入的为时间戳)
 *
 *  @param timeStamp               时间戳(从1970.1.1 08:00开始，到现在的秒数)
 *  @param abbreviations           月份是否缩写（YES: Jan ; NO:January ）
 *  @param EnglishShortNameForDate 日期是否加后缀（YES: 1st, 2nd.. ; NO : 1）
 *
 *  @return 英文格式日期 ;例如：Mon 1st, 2015
 */
+ (NSString *)EngLishDateWithTimeStamp:(NSString *)timeStamp
                          abbreviations:(BOOL)abbreviations
                EnglishShortNameForDate:(BOOL)EnglishShortNameForDate;


/**
 *  时间字符串转成英文格式日期(时间字符串格式为yyyy-MM-dd格式)
 *
 *  @param timeNormal              时间字符串2015-09-01（必须10位）
 *  @param abbreviations           月份是否缩写（YES: Jan ; NO:January ）
 *  @param EnglishShortNameForDate 日期是否加后缀（YES: 1st, 2nd.. ; NO : 1）
 *
 *  @return 英文格式日期 ;例如：Mon 1st, 2015
 */
+ (NSString *)EngLishDateWithTimeString:(NSString *)timeNormal
                           abbreviations:(BOOL)abbreviations
                 EnglishShortNameForDate:(BOOL)EnglishShortNameForDate;

/**
 *  将一个NSDate转换转成英文日期
 *
 *  @param date                    时间
 *  @param abbreviations           月份是否缩写（YES: Jan ; NO:January ）
 *  @param EnglishShortNameForDate 日期是否加后缀（YES: 1st, 2nd.. ; NO : 1）
 *
 *  @return 英文格式日期 ;例如：Mon 1st, 2015
 */
+ (NSString *)EngLishDateWithDate:(NSDate *)date
                     abbreviations:(BOOL)abbreviations
           EnglishShortNameForDate:(BOOL)EnglishShortNameForDate;

@end
