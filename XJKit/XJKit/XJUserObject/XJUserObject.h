//
//  XJUserObject.h
//  XJKit
//
//  Created by 曾宪杰 on 2019/1/4.
//  Copyright © 2019 zengxianjie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*
 VC:
     XJUserObject *obj = [XJUserObject shareWeakInstance];
    //配置参数...
     obj.name = @"小明";
 */
@interface XJUserObject : NSObject<NSCopying,NSSecureCoding>

@property (nonatomic,copy) NSString *name;
@property int age;

+ (id)shareWeakInstance;

@end

NS_ASSUME_NONNULL_END
