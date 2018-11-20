
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(__CLASSNAME__)    \
\
    + (__CLASSNAME__*) sharedInstance;    \


#define SYNTHESIZE_SINGLETON_FOR_CLASS(__CLASSNAME__)    \
\
    static __CLASSNAME__ *instance = nil;   \
\
    + (__CLASSNAME__ *)sharedInstance{ \
        static dispatch_once_t onceToken;   \
        dispatch_once(&onceToken, ^{    \
            if (nil == instance){   \
                instance = [[__CLASSNAME__ alloc] init];    \
            }   \
    }); \
\
    return instance;   \
}   \

typedef void(^OpenCameraOrPhotoBlock)(UIImage *image);

@interface OpenCameraOrPhoto : NSObject

SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(OpenCameraOrPhoto);

+ (void)showOpenCameraOrPhotoWithView:(UIView *)view withBlock:(OpenCameraOrPhotoBlock)openCameraOrPhotoBlock;

@property (nonatomic,copy) OpenCameraOrPhotoBlock openCameraOrPhotoBlock;

/**
 自动拍照
 */
+ (void)takePhotoBtnClick;


@end
