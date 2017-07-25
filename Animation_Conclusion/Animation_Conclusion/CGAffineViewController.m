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
    return [UIImage imageNamed:[NSString stringWithFormat:@"%ld.png", index + 1]];
}



- (void)dealloc
{

    [_animatedImagesView removeFromSuperview];

}

@end
