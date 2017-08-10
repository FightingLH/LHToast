//
//  LHSpreadViewController.m
//  Animation_Conclusion
//
//  Created by lh on 2017/8/8.
//  Copyright © 2017年 lh. All rights reserved.
//

#import "LHSpreadViewController.h"
#import "LHSpreadTransition.h"
@interface LHSpreadViewController ()<UIViewControllerTransitioningDelegate>
@property (nonatomic, strong) LHSpreadTransition *interactiveTransition;
@end

@implementation LHSpreadViewController
- (void)dealloc{
    NSLog(@"销毁了");
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor greenColor];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pic1.jpg"]];
    [self.view addSubview:imageView];
    imageView.frame = self.view.frame;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"点我或向下滑动dismiss" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 50, self.view.frame.size.width, 50);
    [self.view addSubview:button];
}

- (void)dismiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [LHSpreadTransition transitionWithTransitionType:XWCircleSpreadTransitionTypePresent];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return [LHSpreadTransition transitionWithTransitionType:XWCircleSpreadTransitionTypeDismiss];
}

@end
