//
//  CircleViewController.m
//  Animation_Conclusion
//
//  Created by lh on 2017/7/18.
//  Copyright © 2017年 lh. All rights reserved.
//

#import "CircleViewController.h"
#import "LHCircleView.h"
@interface CircleViewController ()

@end

@implementation CircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"圆形进度条-下载进度";
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    LHCircleView *circleView = [[LHCircleView alloc]initWithFrame:CGRectMake(50, 100, 150, 150)];
    circleView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:circleView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{

}

@end
