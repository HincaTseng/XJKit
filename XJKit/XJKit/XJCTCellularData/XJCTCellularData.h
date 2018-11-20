//
//  XJCTCellularData.h
//  XJKit
//
//  Created by 曾宪杰 on 2018/6/26.
//  Copyright © 2018年 曾宪杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreTelephony/CTCellularData.h>
typedef void (^XJNetStateBlock) (CTCellularDataRestrictedState state);
@interface XJCTCellularData : NSObject
@property (nonatomic,copy) XJNetStateBlock netState;

- (void)showNetState:(XJNetStateBlock) showState;

@end
