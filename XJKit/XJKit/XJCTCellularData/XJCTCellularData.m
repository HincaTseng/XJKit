//
//  XJCTCellularData.m
//  XJKit
//
//  Created by 曾宪杰 on 2018/6/26.
//  Copyright © 2018年 曾宪杰. All rights reserved.
//

#import "XJCTCellularData.h"

@implementation XJCTCellularData

- (void)showNetState:(XJNetStateBlock)showState {
   self.netState = showState;
    CTCellularData *cellData = [[CTCellularData alloc] init];
    cellData.cellularDataRestrictionDidUpdateNotifier = ^(CTCellularDataRestrictedState state) {
        switch (state) {
            case kCTCellularDataRestricted:
                NSLog(@"Restricted");
                //open it
               
                break;
            case kCTCellularDataNotRestricted:
                NSLog(@"NotRestricted");
                break;
            case kCTCellularDataRestrictedStateUnknown:
                NSLog(@"Unknown");
               
                break;
            default:
                break;
        }
    };
}
@end
