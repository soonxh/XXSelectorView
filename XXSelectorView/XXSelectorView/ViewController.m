//
//  ViewController.m
//  XXSelectorView
//
//  Created by 徐徐 on 2017/8/2.
//  Copyright © 2017年 徐徐. All rights reserved.
//

#import "ViewController.h"
#import "XXSelectorView.h"


@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong) XXSelectorView *selectorView;
@property (nonatomic,strong) NSMutableArray *selectorDataArray;
@property (nonatomic,strong) UIScrollView *contentScrollView;
@property (nonatomic,strong) NSMutableArray *viewControllerArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.selectorDataArray addObjectsFromArray:@[@"1",@"2",@"3"]];
    self.title = self.selectorDataArray.firstObject;
    
    for (int i = 0; i < self.selectorDataArray.count; i++) {
        NSString *str = self.selectorDataArray[i];
        UIViewController *vc = [[UIViewController alloc]init];
        vc.title = str;
        [self.viewControllerArray addObject:vc];
        [self.contentScrollView addSubview:vc.view];
        
        vc.view.frame = CGRectMake( i * self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
        switch (i) {
            case 0:
                vc.view.backgroundColor = [UIColor redColor];
                break;
            case 1:
                vc.view.backgroundColor = [UIColor greenColor];
                break;
            case 2:
                vc.view.backgroundColor = [UIColor blueColor];
                break;
            default:
                break;
        }
    }
    
    [self.view addSubview:self.selectorView];
    [self.view addSubview:self.contentScrollView];
    self.contentScrollView.contentSize = CGSizeMake(self.view.frame.size.width * self.selectorDataArray.count, self.contentScrollView.frame.size.height);
    
    __weak typeof(self) weakSelf = self;
    self.selectorView.XXSelectorViewBlcok = ^(NSInteger tag) {
        NSLog(@"%ld",tag);
//        dispatch_async(dispatch_get_main_queue(), ^{
//            CGPoint contentOffset = weakSelf.contentScrollView.contentOffset;
//            contentOffset.x = tag *weakSelf.view.frame.size.width;
//            
//            [weakSelf.contentScrollView setContentOffset:contentOffset animated:YES];
//            weakSelf.title = weakSelf.selectorDataArray[tag];
//        });
       
    };
}

//滑动减速时调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //获取contentOffset
    CGPoint currentOffset = scrollView.contentOffset;

    NSInteger page = currentOffset.x / self.view.frame.size.width;

    self.selectorView.selectedIndex = page;
    
}

#pragma mark lazy
- (NSMutableArray *)selectorDataArray {
    if (!_selectorDataArray) {
        _selectorDataArray = [NSMutableArray new];
    }
    return _selectorDataArray;
}

- (NSMutableArray *)viewControllerArray {
    if (!_viewControllerArray) {
        _viewControllerArray = [NSMutableArray new];
    }
    return _viewControllerArray;
}

- (UIScrollView *)contentScrollView {
    if (!_contentScrollView) {
        _contentScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64 + self.selectorView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - 64 - self.selectorView.frame.size.height)];
        _contentScrollView.delegate = self;
        _contentScrollView.pagingEnabled = YES;
    }
    return _contentScrollView;
}

- (XXSelectorView *)selectorView {
    if (!_selectorView) {
        _selectorView = [[XXSelectorView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 44) andWithTitle:self.selectorDataArray];
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
