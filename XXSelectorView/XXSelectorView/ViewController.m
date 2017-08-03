//
//  ViewController.m
//  XXSelectorView
//
//  Created by 徐徐 on 2017/8/2.
//  Copyright © 2017年 徐徐. All rights reserved.
//

#import "ViewController.h"
#import "XXSelectorView.h"


@interface ViewController ()

@property (nonatomic,strong) XXSelectorView *selectorView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.selectorView];
    [self.selectorView setNeedsDisplay];
    self.selectorView.XXSelectorViewBlcok = ^(NSInteger tag) {
        NSLog(@"%ld",tag);
    };
}

- (XXSelectorView *)selectorView {
    if (!_selectorView) {
        _selectorView = [[XXSelectorView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 44) andWithTitle:@[@"1",@"2",@"3"]];
        _selectorView.backgroundColor = [UIColor lightGrayColor];
        _selectorView.normalColor = [UIColor blackColor];
        _selectorView.selectorColor = [UIColor redColor];
        _selectorView.lineViewColor = [UIColor redColor];
        _selectorView.buttonColor = [UIColor cyanColor];
//        _selectorView.isLineView = NO;
    }
    return _selectorView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
