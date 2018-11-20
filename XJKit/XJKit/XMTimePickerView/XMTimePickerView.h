
#import <UIKit/UIKit.h>

@class XMTimePickerView;
@protocol XMTimePickerViewDelegate <NSObject>

/** 选中的时间 */
- (void)xm_didSelectTimePickerView:(XMTimePickerView *)pickerView andTime:(NSString *)time;

@end

@interface XMTimePickerView : UIView

/** 是否显示今天 */
@property (nonatomic, assign) BOOL isShowToday;

/** 最小时间 */
@property (nullable, weak, nonatomic) NSDate *minimumDate;

/** 代理 */
@property (nonatomic, assign) id<XMTimePickerViewDelegate> delegate;

/** 显示 */
- (void)show;

@end
