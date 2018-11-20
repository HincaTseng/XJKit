
#import "CommonFuction.h"

@implementation CommonFuction

/**
 *  修改statusBar背景色  AppDelegate application.statusBarStyle = UIStatusBarStyleLightContent;
 */
+ (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}

/**
 * 颜色转图片
 */
+ (UIImage*)createImageWithColor:(UIColor*)color{
    
    CGRect rect = CGRectMake(0.0f,0.0f,1.0f,1.0f);
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage * theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

/**
 * 返回文件格式
 */
+ (NSString *)imageFormat:(UIImage *)image
{
    NSString *image_fileType;
    if (UIImagePNGRepresentation(image) == nil) {
        image_fileType = @"image/jpeg";
    }else {
        image_fileType = @"image/png";
    }
        return image_fileType;
}

/**
 *  字符串去掉空格
 */
+ (NSString *)removeSpaceFromStr:(NSString *)str
{
    NSString *strUrl = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    return strUrl;
}

/**
 * 获取当前时间
 */
+(NSString*)getCurrentTimes{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    //现在时间,你可以输出来看下是什么格式
    
    NSDate *datenow = [NSDate date];
    
    //----------将nsdate按formatter格式转成nsstring
    
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    
    return currentTimeString;

}

/**
 * 获取当月第一天
 */
+ (NSString *)getMonthFirstDayWith{
    
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd"];
    NSDate *newDate=[format dateFromString:[self getCurrentTimes]];
    double interval = 0;
    NSDate *firstDate = nil;
    NSDate *lastDate = nil;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    BOOL OK = [calendar rangeOfUnit:NSCalendarUnitMonth startDate:& firstDate interval:&interval forDate:newDate];
    
    if (OK) {
        lastDate = [firstDate dateByAddingTimeInterval:interval - 1];
    }
    NSDateFormatter *myDateFormatter = [[NSDateFormatter alloc] init];
    [myDateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *firstString = [myDateFormatter stringFromDate: firstDate];
//    NSString *lastString = [myDateFormatter stringFromDate: lastDate];
    return firstString;
}

/**
 * 时间戳转成时间
 */
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]/ 1000.0];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

/**
 * 时间戳转成时间HHMMSS
 */
+ (NSString *)timeWithTimeIntervalStringHHMMSS:(NSString *)timeString
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]/ 1000.0];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

/**
 * UTC转换GMT时间HHMMSS
 */
+ (NSString *)timeWithUTCtoGMTStringHHMMSS:(NSString *)timeString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    NSDate *dateFormatted = [dateFormatter dateFromString:timeString];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *locationTimeString=[dateFormatter stringFromDate:dateFormatted];
    return locationTimeString;
}

/**
 * 1381758956325  -> 138175****325
 */
+ (NSString *)coverMidNumWithStar:(NSString *)phoneStr
{
    NSMutableString *str = [NSMutableString stringWithString:phoneStr];
    [str replaceCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    return str;
}

/**
 * 获取昨日日期
 */
+ (NSString *)getYestoday{
    
    NSDate * date = [NSDate date];//当前时间
    NSDate *lastDay = [NSDate dateWithTimeInterval:-24*60*60 sinceDate:date];
    
    NSDateFormatter *myDateFormatter = [[NSDateFormatter alloc] init];
    [myDateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *firstString = [myDateFormatter stringFromDate:lastDay];

    return firstString;
}

/**
  ****5678
 */
+(NSString *)insertSpaceInStr:(NSString *)str{
    NSMutableString *string = [NSMutableString stringWithString:str];
    NSInteger length = string.length;
    NSMutableString *subString = [NSMutableString stringWithString:@""];
    long count = length/4;
    for (int i = 0; i < count - 2; i ++) { // -1
        [subString appendString:@"****"];
    }
    
    [string replaceCharactersInRange:NSMakeRange(4, length - 8) withString:subString]; //0,-4
    
    [string insertString:@"  " atIndex:4];
    [string insertString:@"  " atIndex:10];
    [string insertString:@"  " atIndex:16];
    
    return string;
}

/**
 * 根据字符串生成二维码
 */
+ (UIImage *)createQRForString:(NSString *)qrString withSize:(CGFloat) size {
    // Need to convert the string to a UTF-8 encoded NSData object
    NSData *stringData = [qrString dataUsingEncoding:NSUTF8StringEncoding];
    // Create the filter
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // Set the message content and error-correction level
    [qrFilter setValue:stringData forKey:@"inputMessage"];
    [qrFilter setValue:@"M" forKey:@"inputCorrectionLevel"];
    
    CGRect extent = CGRectIntegral(qrFilter.outputImage.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    // create a bitmap image that we'll draw into a bitmap context at the desired size;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:qrFilter.outputImage fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    // Create an image with the contents of our bitmap
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    // Cleanup
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}

/**
 * MM/YY -> YYMM
 */
+ (NSString *)transformStringYYMM:(NSString *)str{
    NSString *monthStr = [str substringToIndex:1];
    NSString *yearStr = [str substringFromIndex:2];
    NSString *finalStr = [NSString stringWithFormat:@"%@%@",yearStr,monthStr];
    return finalStr;
}

/**
 * nsstring -> nadate
 */
+ (NSDate *)transformTimeStrToDate:(NSString *)str{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];//解决8小时时间差问题
    NSDate *date = [dateFormatter dateFromString:str];
    return date;
}

/**
 * 图片压缩至指定大小
 */
+ (NSData *)compressImageQuality:(UIImage *)image toByte:(NSInteger)maxLength {
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(image, compression);
    if (data.length < maxLength) return data;
    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(image, compression);
        if (data.length < maxLength * 0.9) {
            min = compression;
        } else if (data.length > maxLength) {
            max = compression;
        } else {
            break;
        }
    }
//    UIImage *resultImage = [UIImage imageWithData:data];
    return data;
}

+ (NSString *)currentTimeStr {
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
    NSTimeInterval time=[date timeIntervalSince1970]*1000;// *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    return timeString;
}

//
+ (NSString *)sortParameter:(NSDictionary *)dic {
    
    NSMutableString *contentString = [NSMutableString string];
    NSArray *keys = [dic allKeys];
    //按字母排序
    NSArray *sortArr = [keys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];
    //拼接字符串 没拼接sign
    for (NSString *categoryId in sortArr) {
        if (![categoryId isEqualToString:@"sign"]) {
//            if ([categoryId isEqualToString:@"dic"]) {
//                NSError *error = nil;
//                NSDictionary *bizdict = [dic objectForKey:@"dic"];
//                NSData *jsonData = [NSJSONSerialization dataWithJSONObject:bizdict options:NSJSONWritingPrettyPrinted error:&error];
//                NSMutableData *tempJsonData = [NSMutableData dataWithData:jsonData];
//                NSString *jsonString1 = [[NSString alloc] initWithData:tempJsonData encoding:NSUTF8StringEncoding];
//                NSString *jsonString2 = [jsonString1 stringByReplacingOccurrencesOfString:@":" withString:@":"];
//                [contentString appendFormat:@"dic=%@&",jsonString2];
//            } else {
                [contentString appendFormat:@"%@=%@&",categoryId,[dic valueForKey:categoryId]];
//            }
        }
 
    }
    
    NSMutableArray *valueArray = [NSMutableArray array];
    for (NSString *sortsing in sortArr) {
        NSString *valueString = [dic objectForKey:sortsing];
        [valueArray addObject:valueString];
    }
    NSString * obj = [contentString substringToIndex:contentString.length - 1];
//    [contentString appendFormat:@"timestamp=%@",[dic objectForKey:@"timestamp"]];
//    NSString *strUrl1 = [contentString stringByReplacingOccurrencesOfString:@"  " withString:@""];
//    NSString *strUrl3 = [strUrl1 stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return obj;
    
    
}

+ (NSString *)getUUID {
    return [[UIDevice currentDevice] identifierForVendor].UUIDString;
}

- (void)sortedDictionarybyLowercaseString:(NSDictionary *)dict{
    
    //将所有的key放进数组
    NSArray *allKeyArray = [dict allKeys];
    
    //序列化器对数组进行排序的block 返回值为排序后的数组
    NSArray *afterSortKeyArray = [allKeyArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        /**
         In the compare: methods, the range argument specifies the
         subrange, rather than the whole, of the receiver to use in the
         comparison. The range is not applied to the search string.  For
         example, [@"AB" compare:@"ABC" options:0 range:NSMakeRange(0,1)]
         compares "A" to "ABC", not "A" to "A", and will return
         NSOrderedAscending. It is an error to specify a range that is
         outside of the receiver's bounds, and an exception may be raised.
         
         - (NSComparisonResult)compare:(NSString *)string;
         
         compare方法的比较原理为,依次比较当前字符串的第一个字母:
         如果不同,按照输出排序结果
         如果相同,依次比较当前字符串的下一个字母(这里是第二个)
         以此类推
         
         排序结果
         NSComparisonResult resuest = [obj1 compare:obj2];为从小到大,即升序;
         NSComparisonResult resuest = [obj2 compare:obj1];为从大到小,即降序;
         
         注意:compare方法是区分大小写的,即按照ASCII排序
         */
        //小写转化
        obj1 = [obj1 lowercaseString];
        obj2 = [obj2 lowercaseString];
        //排序操作
        NSComparisonResult resuest = [obj1 compare:obj2];
        return resuest;
    }];
    NSLog(@"afterSortKeyArray:%@",afterSortKeyArray);
    
    //通过排列的key值获取value
    NSMutableArray *valueArray = [NSMutableArray array];
    for (NSString *sortsing in afterSortKeyArray) {
        NSString *valueString = [dict objectForKey:sortsing];
        [valueArray addObject:valueString];
    }
    NSLog(@"valueArray:%@",valueArray);
}


+(NSString *)convertToJsonData:(NSDictionary *)dict

{
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
        NSLog(@"%@",error);
        
    }else{
        
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
    
}


@end
