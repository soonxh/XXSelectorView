//
//  XXSelectorView.h
//  XXSelectorView
//
//  Created by 徐徐 on 2017/8/2.
//  Copyright © 2017年 徐徐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XXSelectorView : UIView

//是否需要下划线 (默认YES，默认显示)
@property (nonatomic,assign) BOOL isLineView;
//按钮正常的颜色
@property (nonatomic,strong) UIColor *normalColor;
//按钮选中的颜色
@property (nonatomic,strong) UIColor *selectorColor;
//下划线的颜色
@property (nonatomic,strong) UIColor *lineViewColor;
//按钮的背景色
@property (nonatomic,strong) UIColor *buttonColor;

//回调当前选中的按钮
@property (nonatomic,copy) void (^XXSelectorViewBlcok) (NSInteger tag);

- (instancetype)initWithFrame:(CGRect)frame andWithTitle:(NSArray *)titleArray;

@end
