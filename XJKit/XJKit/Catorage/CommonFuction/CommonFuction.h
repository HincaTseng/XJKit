

#import <Foundation/Foundation.h>

@interface CommonFuction : NSObject
/**
 *  修改statusBar背景色 AppDelegate application.statusBarStyle = UIStatusBarStyleLightContent;
 */
+ (void)setStatusBarBackgroundColor:(UIColor *)color;
/**
 * 颜色转图片
 */
+ (UIImage*)createImageWithColor:(UIColor*)color;
/**
 * 返回文件格式
 */
+ (NSString *)imageFormat:(UIImage *)image;
/**
 *  字符串去掉空格
 */
+ (NSString *)removeSpaceFromStr:(NSString *)str;
/**
 * 获取当前时间
 */
+(NSString*)getCurrentTimes;
/**
 * 获取当月第一天
 */
+ (NSString *)getMonthFirstDayWith;
/**
 * 时间戳转成时间
 */
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString;
/**
 * 1381758956325  -> 138175****325
 */
+ (NSString *)coverMidNumWithStar:(NSString *)phoneStr;
/**
 * 获取昨日日期
 */
+ (NSString *)getYestoday;
/**
 * ****5678
 */
+(NSString *)insertSpaceInStr:(NSString *)str;
/**
 * 根据字符串生成二维码
 */
+ (UIImage *)createQRForString:(NSString *)qrString withSize:(CGFloat) size;
/**
 * MM/YY -> YYMM
 */
+ (NSString *)transformStringYYMM:(NSString *)str;
/**
 * nsstring -> nadate
 */
+ (NSDate *)transformTimeStrToDate:(NSString *)str;
/**
 * 时间戳转成时间HHMMSS
 */
+ (NSString *)timeWithTimeIntervalStringHHMMSS:(NSString *)timeString;

/**
 * UTC 转换GMT时间HHMMSS
 */
+ (NSString *)timeWithUTCtoGMTStringHHMMSS:(NSString *)timeString;
/**
 * 图片压缩至指定大小
 */
+ (NSData *)compressImageQuality:(UIImage *)image toByte:(NSInteger)maxLength;

/**
*获取当前时间戳
 */
+ (NSString *)currentTimeStr;

/**
 ASCII码排序字典
 */
+ (NSString *)sortParameter:(NSDictionary *)dic;

/**
 uuid
 */
+ (NSString *)getUUID;

/**
 用户

 */
+ (NSString *)userInfo;


/**
 按ascii码从小到大排

 */
- (void)sortedDictionarybyLowercaseString:(NSDictionary *)dict;


/**
 字符串转json

 */
+(NSString *)convertToJsonData:(NSDictionary *)dict;
@end
