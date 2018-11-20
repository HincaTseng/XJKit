//
//  NSDate+SL.h
//
//  Created by apple on 14-5-9.
//  Copyright (c) 2014年 seven All rights reserved.
//

#import "NSDate+Extension.h"


@implementation NSDate (Extension)

- (BOOL)isToday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear;
    
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    return
    (selfCmps.year == nowCmps.year) &&
    (selfCmps.month == nowCmps.month) &&
    (selfCmps.day == nowCmps.day);
}

- (BOOL)isYesterday
{
    // 2014-05-01
    NSDate *nowDate = [[NSDate date] dateWithYMD];
    
    // 2014-04-30
    NSDate *selfDate = [self dateWithYMD];
    
    // 获得nowDate和selfDate的差距
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay fromDate:selfDate toDate:nowDate options:0];
    return cmps.day == 1;
}

- (NSDate *)dateWithYMD
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *selfStr = [fmt stringFromDate:self];
    return [fmt dateFromString:selfStr];
}

- (NSString *)dateWithHHssString
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"HH:mm";
    return [fmt stringFromDate:self];
}


- (NSString *)dateWithYMDString
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    return [fmt stringFromDate:self];
}

- (BOOL)isThisYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear;
    
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    return nowCmps.year == selfCmps.year;
}

- (NSDateComponents *)deltaWithNow
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unit fromDate:self toDate:[NSDate date] options:0];
}

+ (NSString *)dateWithTimeIntervalSince1970:(NSTimeInterval)date1970Str dateFormat:(DateFormat)DateFormat
{
    
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:date1970Str];
    NSDateFormatter * fat = [[NSDateFormatter alloc] init];
    
    switch (DateFormat) {
        case DateFormat_yyyyMMdd:
            fat.dateFormat = @"yyyy-MM-dd";
            break;
            
        case DateFormat_MMdd:
            fat.dateFormat = @"MM-dd";
            break;
            
        case DateFormat_yyyyMMddHHmmss:
            fat.dateFormat = @"yyyy-MM-dd HH:mm:ss";
            break;
            
        default:
            break;
    }
    return [fat stringFromDate:date];
}
+ (NSInteger)daysOfMonthInCurrentDate
{
    NSDate * today = [NSDate date];
    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSRange days = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:today];
    return days.length;
}

+ (NSString *)EngLishDateWithTimeString:(NSString *)timeNormal abbreviations:(BOOL)abbreviations EnglishShortNameForDate:(BOOL)EnglishShortNameForDate {
    
    return [self subStingOfYMD:timeNormal abbreviations:abbreviations EnglishShortNameForDate:EnglishShortNameForDate];
}

+ (NSString *)timeWithTimeStamp:(NSString *)timeStamp
{
    //设置标准格式yyyy-mm-dd
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"HH:mm"];
    NSDate *changeDate = [NSDate dateWithTimeIntervalSince1970:[timeStamp doubleValue]];
    NSString *time = [formatter stringFromDate:changeDate];
    
    return time;
}

/** 将一个时间戳转换为2015-05-20格式的字符串，去掉0，再将其的月份转成英文月份
 *
 *  @param time  2015-05-20格式的字符串
 *
 *  @param abbreviations  是否使用月份缩写 是否使用日期缩写
 *
 *  @return 英文格式日期（可选） */
+ (NSString *)EngLishDateWithTimeStamp:(NSString *)timeStamp abbreviations:(BOOL)abbreviations EnglishShortNameForDate:(BOOL)EnglishShortNameForDate
{
    //设置标准格式yyyy-mm-dd
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *changeDate = [NSDate dateWithTimeIntervalSince1970:[timeStamp doubleValue]];
    NSString *time = [formatter stringFromDate:changeDate];
    
    
    return [self subStingOfYMD:time abbreviations:abbreviations EnglishShortNameForDate:EnglishShortNameForDate];
    
}

/** 将一个NSDate转换为2015-05-20格式的字符串，去掉0，再将其的月份转成英文月份
 *
 *  @param time  2015-05-20格式的字符串
 *
 *  @param abbreviations  是否使用月份缩写 是否使用日期缩写
 *
 *  @return 英文格式日期（可选） */
+ (NSString *)EngLishDateWithDate:(NSDate *)date abbreviations:(BOOL)abbreviations EnglishShortNameForDate:(BOOL)EnglishShortNameForDate{
    
    //设置标准格式yyyy-mm-dd
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *timeNormal = [formatter stringFromDate:date];
    
    return [self subStingOfYMD:timeNormal abbreviations:abbreviations EnglishShortNameForDate:EnglishShortNameForDate];
}

#pragma mark - Private
+ (NSString *)subStingOfYMD:(NSString *)time abbreviations:(BOOL)abbreviations EnglishShortNameForDate:(BOOL)EnglishShortNameForDate{
    
    //分别截取年月日
    //month
    NSRange range;
    range.length = 2;
    range.location = 5;
    NSString * a = [time substringWithRange:range];
    int aa = [a intValue];
    
    NSArray * array = nil;
    if (abbreviations) {//是否使用月份缩写
        array = @[@"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun", @"Jul", @"Aug", @"Sep", @"Oct", @"Nov", @"Dec"];
    } else {
        array = @[@"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December"];
    }
    
    NSString * timeStr = time;
    //day
    NSString * month = array[aa - 1];
    NSRange rangeDay;
    rangeDay.length = 2;
    rangeDay.location = 8;
    NSString * day = [time substringWithRange:rangeDay];
    
    //year
    NSRange rangeYear;
    rangeYear.length = 4;
    rangeYear.location = 0;
    NSString * year = [time substringWithRange:rangeYear];
    if (EnglishShortNameForDate) {//是否使用日期缩写
        if ([day intValue] > 9) {
            timeStr = [NSString stringWithFormat:@"%@ %@th", month, day];
        } else if ([day intValue] == 1) {
            day = [day stringByReplacingOccurrencesOfString:@"0" withString:@""];
            timeStr = [NSString stringWithFormat:@"%@ %@st", month, day];
        } else if ([day intValue] == 2) {
            day = [day stringByReplacingOccurrencesOfString:@"0" withString:@""];
            timeStr = [NSString stringWithFormat:@"%@ %@nd", month, day];
        } else if ([day intValue] == 3) {
            day = [day stringByReplacingOccurrencesOfString:@"0" withString:@""];
            timeStr = [NSString stringWithFormat:@"%@ %@rd", month, day];
        } else {
            day = [day stringByReplacingOccurrencesOfString:@"0" withString:@""];
            timeStr = [NSString stringWithFormat:@"%@ %@th", month, day];
        }
        time = [NSString stringWithFormat:@"%@,%@",timeStr,year];
    }else {
        time = [NSString stringWithFormat:@"%@ %@,%@",month,day,year];
    }
    
    return time;
    
}

@end
