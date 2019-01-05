//
//  XJUserObject.m
//  XJKit
//
//  Created by 曾宪杰 on 2019/1/4.
//  Copyright © 2019 zengxianjie. All rights reserved.
//

#import "XJUserObject.h"

@implementation XJUserObject

static __weak XJUserObject *instance;

+ (id)shareWeakInstance {
    XJUserObject *strongInstance = instance;
    @synchronized (self) {
        strongInstance = [[super allocWithZone:NULL] init];
        instance = strongInstance;
    }
    return strongInstance;
}

//+ (id)strongInstance {
//    static XJUserOBject *instance = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        instance  = [[super allocWithZone:NULL] init];
//  这个单利不会释放。
//    });
//    return instance;
//}

+ (id)allocWithZone:(struct _NSZone *)zone {
    return [XJUserObject shareWeakInstance];
}

- (id)copyWithZone:(nullable NSZone *)zone {
    return [XJUserObject shareWeakInstance];
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInt:self.age forKey:@"age"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age = [aDecoder decodeIntForKey:@"age"];
    }
    return self;
}

//在VC中...
#pragma mark - 归档

//    NSError *error;
//    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:XJUserObject.class requiringSecureCoding:YES error:&error];
//    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject] stringByAppendingPathComponent:@"user.plist"];
//    [data writeToFile:path atomically:YES];
//    NSAssert(error, @"存档错误");
    


#pragma mark - 解档

//    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject] stringByAppendingPathComponent:@"user.plist"];
//    NSData *data = [NSData dataWithContentsOfFile:path];
//    NSError *error;
//    XJUserObject *op = (XJUserObject *)[NSKeyedUnarchiver unarchivedObjectOfClass:XJUserObject.class fromData:data error:&error];
//    NSLog(@"op name is%@\n",op.name);



+ (BOOL)supportsSecureCoding {
    return YES;
}

- (void)dealloc {
    NSLog(@"XJUserObject delloc %s",__func__);
}

@end


