//
//  XJTopView.m
//  SuperShidle
//
//  Created by 曾宪杰 on 2018/7/7.
//  Copyright © 2018年 zengxianjie. All rights reserved.
//

#import "XJTopView.h"

@implementation XJTopView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [[NSBundle mainBundle] loadNibNamed:@"XJTopView" owner:self options:nil];
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.ContentView];
        [self UI];
    }
    return self;
}

- (void)UI {
    self.ContentView.backgroundColor = XJBlue;
    self.bottomView.backgroundColor = [UIColor clearColor];
    self.viewOne.backgroundColor = XJGray;
    
    self.xjSearchBar.delegate = self;
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, -SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT)];
    view.backgroundColor = XJBlue;
    
    [self addSubview:view];
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"searchBarSearchButtonClicked: %@",searchBar.text);
    if ([searchBar.text length] == 0) return;
    if (self.searchDelegate && [self.searchDelegate respondsToSelector:@selector(xjSearchButtonClicked:text:)]) {
        [self.searchDelegate xjSearchButtonClicked:searchBar text:searchBar.text];
    }
}


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
    if ([searchText length] > 10) {
        [SVProgressHUD showErrorWithStatus:NSLocalizedString(@"searchalert", nil)];
        [SVProgressHUD dismissWithDelay:1.0];
        [searchBar setText:@""];
        [searchBar resignFirstResponder];
        return;
    }
    else if ([searchText length]  == 0) {
        NSLog(@"点击xjSearchCancelButtonClicked");
        [searchBar resignFirstResponder];
        if (self.searchDelegate && [self.searchDelegate respondsToSelector:@selector(xjSearchCancelButtonClicked:)]) {
            [self.searchDelegate xjSearchCancelButtonClicked:searchBar];
        }
    }
}

- (IBAction)InfoClick:(UIButton *)sender {
    if (self.searchDelegate && [self.searchDelegate respondsToSelector:@selector(xjSearchInfoClick:)]) {
        [self.searchDelegate xjSearchInfoClick:sender.tag];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.xjSearchBar resignFirstResponder];
}

- (void)drawRect:(CGRect)rect {
    self.ContentView.frame = rect;
}

@end
