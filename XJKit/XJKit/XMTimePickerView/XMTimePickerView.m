

#import "XMTimePickerView.h"
#import "UIView+Extension.h"
#import "UIColor+XJHex.h"
/** 时间格式 */
#define DateFormat @"yyyy.MM"

#define kITLocalDate(date) \

// 宽高
#define WIDTH  [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

#define XM_PICKER_HEIGHT  207
#define XM_PICKER_IPHONE_X_HEIGHT  (HEIGHT == 812?(34 + XM_PICKER_HEIGHT):XM_PICKER_HEIGHT)

@interface XMTimePickerView ()<UIPickerViewDelegate,UIPickerViewDataSource>

/** 最大时间 */
@property (nullable, weak, nonatomic) NSDate *maximumDate;

/** 底部View */
@property (nonatomic,strong) UIView *bottomView;

/** 选择器 */
@property (nonatomic,strong) UIPickerView *pickerView;

/** 年份Max */
@property (nonatomic, assign) NSInteger maxYear;

/** 月份Max */
@property (nonatomic, assign) NSInteger maxMonth;

/** 年份min */
@property (nonatomic, assign) NSInteger minYear;

/** 月份min */
@property (nonatomic, assign) NSInteger minMonth;

@property (strong, nonatomic) NSDateFormatter *dateFormatter;

/** 年份数组 */
@property (nonatomic,strong) NSMutableArray *yearArray;

/** 月份数组 */
@property (nonatomic,strong) NSMutableArray *monthArray;

/** 是否选择至今 */
@property (nonatomic, assign) BOOL isChooseToday;

/** 选中的年份 */
@property (nonatomic, copy) NSString *choosedYear;

/** 选中的月份 */
@property (nonatomic, copy) NSString *choosedMonth;

/** 是否是当前年份 */
@property (nonatomic, assign) BOOL isCurrentYear;

/** 是否是第一年 */
@property (nonatomic, assign) BOOL isFirstYear;

@end

@implementation XMTimePickerView

- (NSMutableArray *)yearArray{
    if (_yearArray == nil) {
        _yearArray = [[NSMutableArray alloc] init];
    }
    return _yearArray;
}

- (NSMutableArray *)monthArray{
    if (_monthArray == nil) {
        _monthArray = [[NSMutableArray alloc] init];
        for (int i = 1; i<=12; i++) {
            [_monthArray addObject:[NSString stringWithFormat:@"%02d",i]];
        }
    }
    return _monthArray;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        self.isShowToday = YES; // 默认显示今天
        
    }
    return self;
}

- (NSDateFormatter *)dateFormatter {
    if (!_dateFormatter) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        _dateFormatter.dateFormat = DateFormat;
    }
    return _dateFormatter;
}

#pragma mark - 显示
- (void)show{
    
    // 初始化获取数据
    [self getData];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    self.center = CGPointMake(WIDTH * 0.5, HEIGHT * 0.5);
    self.bounds = CGRectMake(0, 0, WIDTH, HEIGHT);
    // 添加到窗口上
    [window addSubview:self];
    
    // 底部View
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor whiteColor];
    bottomView.frame = CGRectMake(0, HEIGHT, WIDTH, XM_PICKER_IPHONE_X_HEIGHT);
    [self addSubview:bottomView];
    self.bottomView = bottomView;
    
    // 取消
    UIButton *cancelBtn = [[UIButton alloc] init];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
    cancelBtn.frame = CGRectMake(12, 12, 70, 30);
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [cancelBtn setTitleColor:[UIColor colorWithHexString:@"#418CE2"] forState:UIControlStateNormal];
    [bottomView addSubview:cancelBtn];
    
    // 确定
    UIButton *nextBtn = [[UIButton alloc] init];
    [nextBtn setTitle:@"确定" forState:UIControlStateNormal];
    nextBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [nextBtn setTitleColor:[UIColor colorWithHexString:@"#418CE2"] forState:UIControlStateNormal];
    nextBtn.frame = CGRectMake(WIDTH - 70 -12, 12, 70, 30);
    [nextBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:nextBtn];
    
    [UIView animateWithDuration:0.25 animations:^{
        bottomView.y = HEIGHT - bottomView.height;
    }];
    
    // 选择器
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    pickerView.frame = CGRectMake(0, 50, bottomView.width, 157);
    pickerView.backgroundColor = [UIColor whiteColor];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    pickerView.showsSelectionIndicator = YES;
    [bottomView addSubview:pickerView];
    self.pickerView = pickerView;
    
    if (self.minYear <= 2016){
        
        // 选择器初始化选择2000年
        [pickerView selectRow:(2018 - self.minYear) inComponent:0 animated:NO];
        [self pickerView:pickerView didSelectRow:(2018 - self.minYear) inComponent:0];
    }else{
        [pickerView selectRow:0 inComponent:0 animated:NO];
        [self pickerView:pickerView didSelectRow:0 inComponent:0];
    }
}

#pragma mark - 始化获取数据
- (void)getData{
    
    // 最大时间
    if (self.maximumDate == nil) {
        self.maximumDate = [self.dateFormatter dateFromString:[self getCurrentTimes]];
    }
    self.maximumDate = [self.maximumDate copy];
    
    kITLocalDate(_maximumDate);
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth fromDate:_maximumDate];
    self.maxYear = [components year];
    self.maxMonth = [components month];
//    NSLog(@"最大时间 %ld   %ld",self.maxYear,self.maxMonth);
    
    // 最小时间
    if (self.minimumDate == nil) {
        self.minimumDate = [self.dateFormatter dateFromString:@"2016.01"];
    }
    
    self.minimumDate = [self.minimumDate copy];
    
    kITLocalDate(_minimumDate);
    
    NSCalendar *calendar2 = [NSCalendar currentCalendar];
    NSDateComponents *components2 = [calendar2 components:NSCalendarUnitYear|NSCalendarUnitMonth fromDate:self.minimumDate];
    self.minYear = [components2 year];
    self.minMonth = [components2 month];
    
//    NSLog(@"最小时间 %ld   %ld",self.minYear,self.minMonth);
    
    // 年份数组
    for (NSInteger i = self.minYear; i<=self.maxYear; i++) {
        
        [self.yearArray addObject:[NSString stringWithFormat:@"%ld",i]];
    }
    
    if (self.isShowToday == YES) {
        
        [self.yearArray addObject:@"至今"];
    }
    
//    NSLog(@"年份数组 %@",self.yearArray);
}

/**
 *  获取当前的时间 如:1970.01
 */
- (NSString*)getCurrentTimes{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    [formatter setDateFormat:@"yyyy-MM"];
    //现在时间,你可以输出来看下是什么格式
    NSDate *datenow = [NSDate date];
    //----------将nsdate按formatter格式转成nsstring
    NSString *currentTimeString = [formatter stringFromDate:datenow];
//    NSLog(@"currentTimeString = %@",currentTimeString);
    return currentTimeString;
}

// 返回选择器有几列.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

// 返回每组有几行
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
   
    if (component == 0) {
        
        return self.yearArray.count;
        
    }else{
        
        if (self.isShowToday == YES) { // 显示今天
            
            if (_isChooseToday == YES) {
                
                return 1;
            }else{
                
                if (_isCurrentYear == YES) { // 当前年
                    
                    if (_isFirstYear == YES) {
                        
                        return (self.maxMonth - self.minMonth +1);
                    }else{
                        
                        return self.maxMonth;
                    }
                    
                }else{
                    
                    if (_isFirstYear == YES) {
                        
                        return (12 - self.minMonth +1);
                    }else{
                        
                        return 12;
                    }
                }
            }
        }else{ // 不显示今天
            
            if (_isCurrentYear == YES) { // 当前年
                
                if (_isFirstYear == YES) {
                    
                    return (self.maxMonth - self.minMonth +1);
                }else{
                    
                    return self.maxMonth;
                }
                
            }else{
                
                if (_isFirstYear == YES) {
                    
                    return (12 - self.minMonth +1);
                }else{
                    
                    return 12;
                }
            }
        }
        
    }
}

#pragma mark - 代理
// 返回第component列第row行的内容（标题）
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        
        return self.yearArray[row];
        
    }else{
        
        if (_isChooseToday == YES) {

            return @"--";
        }else{
            
            if (_isFirstYear == YES) {
                
                return self.monthArray[self.minMonth + row -1];
            }else{
                
                return self.monthArray[row];
            }
        }
    }
}

// 选中第component第row的时候调用
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
//    NSLog(@"第%ld列，第%ld行",component,row);
    
    if (self.isShowToday == YES) { // 显示今天
        
        if (component == 0) {
            
            if (row == self.yearArray.count -1) {
                
                _isChooseToday = YES;
                
            }else{
                
                _isChooseToday = NO;
                
                if (row == self.yearArray.count - 2) { // 当前年份
                    
                    _isCurrentYear = YES; // 当前年
                }else{
                    
                    _isCurrentYear = NO;
                    
                }
                if (row == 0) {
                    
                    _isFirstYear = YES;
                }else{
                    _isFirstYear = NO;
                }
            }
            
            [pickerView reloadComponent:1];
            [pickerView selectRow:0 inComponent:1 animated:NO];
            
            self.choosedYear = self.yearArray[row];
            
        }else{
            
            if (_isFirstYear == YES) { // 第一年
                
                self.choosedMonth = self.monthArray[row + self.minMonth - 1];
            }else{
                
                self.choosedMonth = self.monthArray[row];
            }
        }
        
    }else{// 不显示今天
        
        if (component == 0) {
            
            if (row == self.yearArray.count - 1) { // 当前年份
                
                _isCurrentYear = YES; // 当前年
            }else{
                
                _isCurrentYear = NO;
                
            }
            if (row == 0) {
                
                _isFirstYear = YES;
            }else{
                _isFirstYear = NO;
            }
            [pickerView reloadComponent:1];
            [pickerView selectRow:0 inComponent:1 animated:NO];
            
            self.choosedYear = self.yearArray[row];
        }else{
            
            if (_isFirstYear == YES) { // 第一年
                
                self.choosedMonth = self.monthArray[row + self.minMonth - 1];
            }else{
                
                self.choosedMonth = self.monthArray[row];
            }
        }
    }
}

// 重写方法设置字体
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    //设置分割线的颜色
    for(UIView *singleLine in pickerView.subviews){
        
        if (singleLine.frame.size.height < 1){
            
            singleLine.backgroundColor = [UIColor grayColor];
        }
    }
    
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:18]];
        pickerLabel.textColor = [UIColor blackColor];
    }
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    
    return pickerLabel;
}

#pragma mark - 取消
- (void)cancelClick{
    
    [self removeView];
    
}

#pragma mark - 确定
- (void)nextBtnClick{
    
    if ([self.delegate respondsToSelector:@selector(xm_didSelectTimePickerView:andTime:)]) {
        
        NSString *timeStr;
        if ([self.choosedYear isEqualToString:@"至今"]) {
            
            timeStr = @"至今";
        }else{
            
            if (self.choosedMonth == nil) {
                
                timeStr = [NSString stringWithFormat:@"%@-%02ld",self.choosedYear,self.minMonth];
            }else{
                
                timeStr = [NSString stringWithFormat:@"%@-%@",self.choosedYear,self.choosedMonth];
            }
        }
        
//        NSLog(@"%@",timeStr);
        [self.delegate xm_didSelectTimePickerView:self andTime:timeStr];
    }
    
    [self removeView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self removeView];
}

#pragma mark - 移除当前视图
- (void)removeView{
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.bottomView.y = HEIGHT;
        
    } completion:^(BOOL finished) {
        
        [self.bottomView removeFromSuperview];
        [self removeFromSuperview];
    }];
}

@end
