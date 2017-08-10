//
//  XWCircleSpreadController.m
//  XWTrasitionPractice
//
//  Created by YouLoft_MacMini on 15/11/25.
//  Copyright © 2015年 YouLoft_MacMini. All rights reserved.
//

#import "XWCircleSpreadController.h"
#import "XWCircleSpreadPresentedController.h"

@interface XWCircleSpreadController ()
@property (nonatomic, weak) UIButton *button;
@end

@implementation XWCircleSpreadController

- (void)dealloc{
    NSLog(@"销毁了");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pic2.jpeg"]];
    [self.view addSubview:imageView];
    imageView.frame = self.view.frame;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button = button;
    [button setTitle:@"点击或\n拖动我" forState:UIControlStateNormal];
    button.titleLabel.numberOfLines = 0;
    button.titleLabel.textAlignment = 1;
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    button.titleLabel.font = [UIFont systemFontOfSize:11];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(present) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor grayColor];
    [self.view addSubview:button];
    button.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 40);
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [button addGestureRecognizer:pan];
}

- (void)present{
    XWCircleSpreadPresentedController *presentVC = [XWCircleSpreadPresentedController new];
    [self presentViewController:presentVC animated:YES completion:nil];
}

- (CGRect)buttonFrame{
    return _button.frame;
}

- (void)pan:(UIPanGestureRecognizer *)panGesture{
    UIView *button = panGesture.view;
    CGPoint newCenter = CGPointMake([panGesture translationInView:panGesture.view].x + button.center.x - [UIScreen mainScreen].bounds.size.width / 2, [panGesture translationInView:panGesture.view].y + button.center.y - [UIScreen mainScreen].bounds.size.height / 2);
    button.center = newCenter;
    [panGesture setTranslation:CGPointZero inView:panGesture.view];
}

@end
