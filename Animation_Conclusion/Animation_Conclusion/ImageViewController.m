//
//  ImageViewController.m
//  Animation_Conclusion
//
//  Created by lh on 2017/7/18.
//  Copyright © 2017年 lh. All rights reserved.
//

#import "ImageViewController.h"
#import "JLAnimatedImagesView.h"

@interface ImageViewController ()<JLAnimatedImagesViewDelegate>
@property (nonatomic, strong)  JLAnimatedImagesView *animatedImagesView;
@end

@implementation ImageViewController

@synthesize animatedImagesView = _animatedImagesView;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.animatedImagesView = [[JLAnimatedImagesView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:self.animatedImagesView];
    self.animatedImagesView.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.animatedImagesView startAnimating:JLAnimatedType_Translation];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [self.animatedImagesView stopAnimating];
}

#pragma mark - JSAnimatedImagesViewDelegate Methods
- (NSInteger)animatedImagesNumberOfImages:(JLAnimatedImagesView *)animatedImagesView
{
    return 3;
}
- (UIImage *)animatedImagesView:(JLAnimatedImagesView *)animatedImagesView imageAtImdex:(NSInteger)index
{
return [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg", index + 1]];
}

- (void)dealloc
{
    _animatedImagesView = nil;

}


@end
