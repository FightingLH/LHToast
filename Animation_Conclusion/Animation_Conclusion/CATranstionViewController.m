//
//  CATranstionViewController.m
//  Animation_Conclusion
//
//  Created by lh on 2017/7/18.
//  Copyright © 2017年 lh. All rights reserved.
//

#import "CATranstionViewController.h"

@interface CATranstionViewController ()<UIScrollViewDelegate>
@property  (nonatomic,strong) UIScrollView *scrollView;
@end

@implementation CATranstionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    for (NSInteger i = 0; i<5; i++)
    {
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width*i, 0, [UIScreen mainScreen].bounds.size.width, 150)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",i+1]];
        [self.scrollView addSubview:imageView];
    }
    [self.view addSubview:self.scrollView];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    
    //调用设置动画
    [self setAnimationWithType:SXmovein duration:1.0 directionSubtype:SXmiddle];
    
}

- (void)setAnimationWithType:(AnimationType)animation
                    duration:(float)durationTime
            directionSubtype:(Direction)subtype
{
    //CATransition实体
    CATransition* ani=[CATransition animation];
    //动画时间:
    ani.duration = durationTime;
    //选择动画过渡方向:
    switch (subtype) {
        case SXleft:
            ani.subtype = kCATransitionFromLeft;
            break;
        case SXright:
            ani.subtype = kCATransitionFromRight;
            break;
        case SXtop:
            ani.subtype = kCATransitionFromTop;
            break;
        case SXbottom:
            ani.subtype = kCATransitionFromBottom;
            break;
        case SXmiddle:
            ani.subtype = kCATruncationMiddle;
            break;
        default:
            break;
    }
    //选择动画效果：
    switch (animation)
    {
        case SXpageCurl:
        {
            ani.type = @"pageCurl";
        }
            break;
        case SXpageUnCurl:
        {
            ani.type = @"pageUnCurl";
        }
            break;
        case SXrippleEffect:
        {
            ani.type = @"rippleEffect";
        }
            break;
        case SXsuckEffect:
        {
            ani.type = @"suckEffect";
        }
            break;
        case SXcube:
        {
            ani.type = @"cube";
        }
            break;
        case SXcameraIrisHollowOpen:
        {
            ani.type = @"cameraIrisHollowOpen";
        }
            break;
        case SXoglFlip:
        {
            ani.type = @"oglFlip";
        }
            break;
        case SXcameraIrisHollowClose:
        {
            ani.type = @"cameraIrisHollowClose";
        }
            break;
        case SXmovein:
            ani.type = kCATransitionMoveIn;
            break;
        case SXpush:
            ani.type = kCATransitionPush;
            break;
        case SXfade:
            ani.type = kCATransitionFade;
            break;
        default:
            break;
    }
    //动画加到图层上
    [self.view.layer addAnimation:ani forKey:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 150)];
        _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width *5, 150);
        _scrollView.delegate = self;
    }
    return _scrollView;
}
@end
