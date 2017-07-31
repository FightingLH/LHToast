//
//  MotionDesignController.m
//  Animation_Conclusion
//
//  Created by lh on 2017/7/28.
//  Copyright © 2017年 lh. All rights reserved.
//

#import "MotionDesignController.h"

@interface MotionDesignController ()

@end

@implementation MotionDesignController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *redBall = [[UIView alloc] initWithFrame:CGRectMake(50, 150, 100, 100)];
    redBall.backgroundColor = [UIColor redColor];
    [self.view addSubview:redBall];
    
    [UIView animateWithDuration:.5 delay:0
                        options:UIViewAnimationOptionCurveEaseInOut animations:^{
                            redBall.transform = CGAffineTransformMakeScale(2.0, 2.0);
                            redBall.transform = CGAffineTransformConcat(
                                                                        CGAffineTransformMakeScale(2.0, 2.0),
                                                                        CGAffineTransformMakeTranslation(75, 0));
                            redBall.transform = CGAffineTransformRotate(redBall.transform, M_PI);
                        } completion:^(BOOL finished) {
                             redBall.transform = CGAffineTransformMakeScale(1.0, 1.0);
                             redBall.transform = CGAffineTransformConcat(
                                                                        CGAffineTransformMakeScale(1.0, 1.0),
                                                                        CGAffineTransformMakeTranslation(50, 0));
                        }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
