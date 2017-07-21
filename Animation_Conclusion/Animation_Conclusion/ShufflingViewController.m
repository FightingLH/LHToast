//
//  ShufflingViewController.m
//  Animation_Conclusion
//
//  Created by lh on 2017/7/20.
//  Copyright © 2017年 lh. All rights reserved.
//

#import "ShufflingViewController.h"
#import "LHScrollView.h"
#define  RGBColor(x,y,z)  [UIColor colorWithRed:x/255.0 green:y/255.0 blue:z/255.0 alpha:1.0]
@interface ShufflingViewController ()

@end

@implementation ShufflingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    CGRect rect = CGRectMake(30, 100, [UIScreen mainScreen].bounds.size.width-60, 50);
    NSMutableArray *images = [NSMutableArray array];
    for (NSInteger i = 0; i < 5; i ++) {
        [images addObject:RGBColor(arc4random()%255, arc4random()%255, arc4random()%255)];
    }
    LHScrollView *scroll = [[LHScrollView alloc] initWithFrame:rect withImages:images withIsRunloop:YES withBlock:^(NSInteger index) {
        NSLog(@"点击了index%zd",index);
    }];
    [self.view addSubview:scroll];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
