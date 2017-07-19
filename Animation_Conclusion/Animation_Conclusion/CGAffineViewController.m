//
//  CGAffineViewController.m
//  Animation_Conclusion
//
//  Created by lh on 2017/7/19.
//  Copyright © 2017年 lh. All rights reserved.
//

#import "CGAffineViewController.h"
#import "JSAnimatedImagesView.h"

@interface CGAffineViewController ()<JSAnimatedImagesViewDelegate>
@property (strong, nonatomic) JSAnimatedImagesView *animatedImagesView;
@end

@implementation CGAffineViewController
@synthesize animatedImagesView = _animatedImagesView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.animatedImagesView = [[JSAnimatedImagesView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:self.animatedImagesView];
     self.animatedImagesView.delegate = self;
    self.animatedImagesView.userInteractionEnabled = YES;
    
    
    UIView *adView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 100)];
    adView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:adView];
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(15, 200, [UIScreen mainScreen].bounds.size.width - 30, 200)];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    
    for (NSInteger i = 0; i< 5; i++) {
        UIButton *testBtn = [[UIButton alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width -250)/6 *(i+1)+i*50, 450, 50, 50)];
        testBtn.backgroundColor = [UIColor whiteColor];
        [testBtn setTitle:[NSString stringWithFormat:@"%ld",i] forState:
         UIControlStateNormal];
        testBtn.layer.cornerRadius = 25;
        testBtn.clipsToBounds = YES;
        [testBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [testBtn addTarget:self action:@selector(toNext) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:testBtn];
    }
  
    
}

- (void)toNext
{
    NSLog(@"头疼");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.animatedImagesView startAnimating];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [self.animatedImagesView stopAnimating];
}

#pragma mark - JSAnimatedImagesViewDelegate Methods

- (NSUInteger)animatedImagesNumberOfImages:(JSAnimatedImagesView *)animatedImagesView
{
    return 2;
}

- (UIImage *)animatedImagesView:(JSAnimatedImagesView *)animatedImagesView imageAtIndex:(NSUInteger)index
{
    return [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg", index + 1]];
}



- (void)dealloc
{
    [_animatedImagesView removeFromSuperview];
    
}

@end
