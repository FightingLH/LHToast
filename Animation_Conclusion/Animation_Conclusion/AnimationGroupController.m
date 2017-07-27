//
//  AnimationGroupController.m
//  Animation_Conclusion
//
//  Created by lh on 2017/7/24.
//  Copyright © 2017年 lh. All rights reserved.
//

#import "AnimationGroupController.h"
#import <QuartzCore/QuartzCore.h>

@interface AnimationGroupController ()

@property (nonatomic, strong)  UIImageView *layImageOne;
@property (nonatomic, strong)  UIImageView *layImageTwo;
@end

@implementation AnimationGroupController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    UIImageView *animateImageTwo = [[UIImageView alloc]init];
    animateImageTwo.frame = CGRectMake(-100, -64, [UIScreen mainScreen].bounds.size.width + 200, [UIScreen mainScreen].bounds.size.height + 128);
    animateImageTwo.image = [UIImage imageNamed:@"2.png"];
    [self.view addSubview:animateImageTwo];
    self.layImageTwo = animateImageTwo;
    
//    UIImageView *animateImage = [[UIImageView alloc]init];
//    animateImage.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
//    animateImage.image = [UIImage imageNamed:@"1.png"];
//    [self.view addSubview:animateImage];
//    self.layImageOne = animateImage;
    
    
    [self animateStart];
}

- (void)animateStart
{
        //透明度变化
//        CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
//        opacityAnimation.fromValue = [NSNumber numberWithFloat:1.0];
//        opacityAnimation.toValue = [NSNumber numberWithFloat:0.5];
//        opacityAnimation.duration = 0.3f;
    //移动
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        animation.autoreverses = YES;
        animation.fromValue = [ NSValue valueWithCGPoint:CGPointMake(0, 0)];
        animation.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 400)];
        animation.repeatCount = 0;
        animation.duration = 0.3;//不设置时候的话，有一个默认的缩放时间.
        animation.removedOnCompletion = NO;
        //位置移动
//        CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
//        animationGroup.duration = 5.0f;
//        animationGroup.autoreverses = NO;   //是否重播，原动画的倒播
//        animationGroup.repeatCount = 1;
//        animationGroup.repeatCount = NSNotFound;//HUGE_VALF;     //HUGE_VALF,源自math.h
//        [animationGroup setAnimations:[NSArray arrayWithObjects: opacityAnimation,animation,nil]];
        [self.layImageTwo.layer addAnimation:animation forKey:@"animationGroup"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
