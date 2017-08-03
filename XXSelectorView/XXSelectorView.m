//
//  XXSelectorView.m
//  XXSelectorView
//
//  Created by 徐徐 on 2017/8/2.
//  Copyright © 2017年 徐徐. All rights reserved.
//

#import "XXSelectorView.h"

@interface XXSelectorView ()

@property (nonatomic,strong) UIButton *currentSortButton;
@property (nonatomic,strong) UIView *lineView;

@property (nonatomic,assign) CGFloat width;


@end

@implementation XXSelectorView

- (instancetype)initWithFrame:(CGRect)frame andWithTitle:(NSArray *)titleArray {
    self = [super initWithFrame:frame];
    if (self) {
        self.isLineView = YES;
        [self configUIWithArray:titleArray];
    }
    return self;
}

- (void)setSelectorArray:(NSArray *)selectorArray {

}

- (void)setNormalColor:(UIColor *)normalColor {
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            [(UIButton *)view setTitleColor:normalColor forState:UIControlStateNormal];
        }
    }
}

- (void)setSelectorColor:(UIColor *)selectorColor {
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            [(UIButton *)view setTitleColor:selectorColor forState:UIControlStateSelected];
        }
    }
}

- (void)setButtonColor:(UIColor *)buttonColor {
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            view.backgroundColor = buttonColor;
        }
    }
}

- (void)setLineViewColor:(UIColor *)lineViewColor {
    self.lineView.backgroundColor = lineViewColor;
}

- (void)setIsLineView:(BOOL)isLineView {
    if (isLineView) {
        self.lineView.hidden = NO;
    } else {
        self.lineView.hidden = YES;
    }
}

- (void)configUIWithArray:(NSArray *)selectorArray {
    
    CGFloat width = self.frame.size.width / selectorArray.count;
    _width = width;
    
    self.lineView = [[UIView alloc]init];

    NSInteger num = 0;
    for (NSString *title in selectorArray) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(num * self.width, 0, self.width, self.frame.size.height);
        button.tag = num;
        [button setTitle:title forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        if (0 == num) {
            button.selected = YES;
            self.currentSortButton = button;
            self.lineView.frame = CGRectMake(0, self.frame.size.height - 2, self.width, 2);
        }
        
        num ++;
    }
    
    [self addSubview:self.lineView];
}

- (void)buttonClick:(UIButton *)sender {
    if (sender != self.currentSortButton) {
        self.currentSortButton.selected = NO;
        self.currentSortButton.userInteractionEnabled = YES;
        self.currentSortButton = sender;
    }
    self.currentSortButton.selected = YES;
    self.currentSortButton.userInteractionEnabled = NO;
    
    [UIView animateWithDuration:0.2 animations:^{
        _lineView.frame = CGRectMake(self.currentSortButton.tag * _width, self.frame.size.height - 2, _width, 2);
    }];

    if (self.XXSelectorViewBlcok) {
        self.XXSelectorViewBlcok(sender.tag);
    }
}


@end
