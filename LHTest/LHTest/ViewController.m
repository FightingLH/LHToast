//
//  ViewController.m
//  LHTest
//
//  Created by lh on 16/9/7.
//  Copyright © 2016年 lh. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "MyLineForward.h"
@interface ViewController ()
@property (nonatomic,strong) UIView *qq;
@property (nonatomic,strong) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //    MyLineForward *my = [[MyLineForward alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    //    my.backgroundColor = [UIColor whiteColor];
    //    [self.view addSubview:my];
    UIView *backView = [[UIView alloc]init];
    backView.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 110);
    [self.view addSubview:backView];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 110);
    imageView.hidden = YES;
    imageView.userInteractionEnabled = YES;
    imageView.backgroundColor = [UIColor grayColor];
    imageView.image = [UIImage imageNamed:@"1.jpg"];
    [backView addSubview:imageView];
    self.imageView = imageView;
    
    _qq = [[UIView alloc] initWithFrame:CGRectMake(0, (110-37)/2, 37, 37)];
    _qq.hidden = NO;
    _qq.layer.contents = (__bridge id )[UIImage imageNamed:@"屏幕快照 2016-09-07 下午2.09.48"].CGImage;
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(btnHandler:)];
    [_qq addGestureRecognizer:gesture];
    self.qq.layer.position = CGPointMake(18.5, 55);
    [backView addSubview:self.qq];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)btnHandler:(UIButton*)btn
{
    CGPoint startPoint = ((CALayer*)[self.qq.layer presentationLayer]).position;
    [self.qq.layer removeAllAnimations];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, startPoint.x, startPoint.y);
    CGPathAddQuadCurveToPoint(path, NULL, 18.5,110-18.5,[UIScreen mainScreen].bounds.size.width/2,110-18.5);
    CGPathAddQuadCurveToPoint(path, NULL, 198,110-37,198,110-37);
    CGPathAddQuadCurveToPoint(path, NULL, 200,18.5,156,37.5);
    CGPathAddQuadCurveToPoint(path, NULL, 100,18.5,100,37.5+25);
    CGPathAddQuadCurveToPoint(path, NULL, 110,110-18.5,200,110-18.5-10);
    CGPathAddQuadCurveToPoint(path, NULL, 222,55,[UIScreen mainScreen].bounds.size.width -18.5,55);
    CAKeyframeAnimation *animate = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animate.delegate = self;
    animate.duration = 5;
    animate.fillMode = kCAFillModeForwards;
    animate.path = path;
    animate.removedOnCompletion = NO;
    CGPathRelease(path);
    [self.qq.layer addAnimation:animate forKey:@"lh"];
    
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    _qq.hidden = YES;
    [UIView animateWithDuration:0.3 animations:^{
        self.imageView.hidden = NO;
        self.imageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 110);
    } completion:^(BOOL finished) {
        self.imageView.hidden = NO;
        self.imageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 110);
    }];
    return;
}
@end
