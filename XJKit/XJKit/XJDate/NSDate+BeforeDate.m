//
//  NSDate+BeforeDate.m
//  XJKit
//
//  Created by 曾宪杰 on 2019/9/3.
//  Copyright © 2019 曾宪杰. All rights reserved.
//

#import "NSDate+BeforeDate.h"

@implementation NSDate (BeforeDate)
//往前推几天
- (NSString *)getNDay:(NSInteger)n {
    NSDate*nowDate = [NSDate date];
    
    NSDate* theDate;
    
    if(n!=0){
        
        NSTimeInterval  oneDay = -24*60*60*1;  //1天的长度 负数
        theDate = [nowDate initWithTimeIntervalSinceNow:oneDay*n];//initWithTimeIntervalSinceNow是从现在往前后推的秒数
        
        theDate = [[NSDate alloc] initWithTimeInterval:oneDay * n sinceDate:nowDate];
    }else{
        
        theDate = nowDate;
    }
    
    NSDateFormatter *date_formatter = [[NSDateFormatter alloc] init];
    [date_formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *the_date_str = [date_formatter stringFromDate:theDate];
    
    return the_date_str;
}
//当前日期
- (NSString *)changeDate:(NSDate *)date {
    NSDateFormatter *dataFormatter = [[NSDateFormatter alloc] init];
    [dataFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString * dateStr = [dataFormatter stringFromDate:date];
    
    return dateStr;
}

/*
 NSDate *a = [self dataStrTODate:_startTimeLab.text];
 NSDate *b = [self dataStrTODate:_endTimeLab.text];
 self.dayLab.text = [MLearnPaperVC numberOfDaysWithFromDate:a toDate:b];间隔几天
 */
+ (NSString *)numberOfDaysWithFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate {
    // 创建一个标准国际时间的日历
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    // 可根据需要自己设置时区.
    calendar.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    // 获取两个日期的间隔
    NSDateComponents *comp = [calendar components:NSCalendarUnitDay fromDate:fromDate toDate:toDate options:NSCalendarWrapComponents];
    //    NSInteger hour = (comp.hour - comp.day * 24);
    return [NSString stringWithFormat:@"%ld天", comp.day];
}

- (NSDate *)dataStrTODate:(NSString *)str {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd "];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    NSDate *date = [formatter dateFromString:str];
    return date;
}
@end
