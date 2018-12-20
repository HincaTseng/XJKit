//
//  XJSearchBar.m
//  SuperShidle
//
//  Created by 曾宪杰 on 2018/7/7.
//  Copyright © 2018年 zengxianjie. All rights reserved.
//

#import "XJSearchBar.h"

@implementation XJSearchBar

-(void)layoutSubviews{
    [super layoutSubviews];
//    UIEdgeInsets idg = UIEdgeInsetsMake(5, 15, 5, CGRectGetMaxX(self.frame));
    [self.heightAnchor constraintEqualToConstant:50].active = YES;
//    for (UIView *view in self.subviews) {
//
//        for (UIView *subView in view.subviews) {
//
//            if ([subView isKindOfClass:[UITextField class]]) {
//
//                subView.frame = CGRectMake(0, 0, self.bounds.size.width,  self.bounds.size.height);
//
//            }
//        }
//    }
//    self.xjSearchBar.layer.shadowColor = [UIColor lightGrayColor].CGColor;
//    self.xjSearchBar.layer.shadowOpacity = 0.5;
//    self.xjSearchBar.layer.shadowRadius = 2.0;
//    self.xjSearchBar.layer.shadowOffset = CGSizeMake(0, 2);
//    self.xjSearchBar.clipsToBounds = NO;

    //更改search圆角
    self.tintColor = [UIColor blueColor];
//    self.backgroundColor = XJBlue;

    UITextField *searchField = [self valueForKey:@"searchField"];
    
    if (searchField) {
        [searchField setBackgroundColor:[UIColor whiteColor]];
//        searchField.layer.cornerRadius = 10.0f;
        searchField.layer.borderColor = [UIColor whiteColor].CGColor;
//        searchField.layer.masksToBounds = YES;
        searchField.frame = CGRectMake(0, 0, self.bounds.size.width,  self.bounds.size.height);
    }
    
    
    UIImage *img = [XJSearchBar GetImageWithColor:XJBlue andHeight:self.bounds.size.height];
    [self setBackgroundImage:img];
}

+ (UIImage*) GetImageWithColor:(UIColor*)color andHeight:(CGFloat)height
{
    CGRect r= CGRectMake(0.0f, 0.0f, 1.0f, height);
    UIGraphicsBeginImageContext(r.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, r);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

@end
