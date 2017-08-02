//
//  OneImageViewController.m
//  Animation_Conclusion
//
//  Created by lh on 2017/8/2.
//  Copyright © 2017年 lh. All rights reserved.
//

#import "OneImageViewController.h"

@interface OneImageViewController ()
@property  (nonatomic, strong)  UIImageView *bgImage;
@end

@implementation OneImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.bgImage = [[UIImageView alloc]init];
    self.bgImage.frame = CGRectMake(-50, -100, [UIScreen mainScreen].bounds.size.width + 100, [UIScreen mainScreen].bounds.size.height + 200);
    self.bgImage.image = [UIImage imageNamed:@"remove"];
    [self.view addSubview:self.bgImage];
    [self animate];
}


- (void)animate
{
    NSInteger i = arc4random()%3;
    NSInteger randomTranslationValueX = 50;
    NSInteger randomTranslationValueY = 100;
    switch (i) {
        case 0:
        {
            randomTranslationValueX = -50;
            randomTranslationValueY = 100;
        }
            break;
        case 1:
        {
            randomTranslationValueX = 50;
            randomTranslationValueY = -100;
        }
            break;
        case 2:
        {
            randomTranslationValueX = -50;
            randomTranslationValueY = -100;
        }
            break;
        case 3:
        {
            randomTranslationValueX = 50;
            randomTranslationValueY = 100;
        }
            break;
        default:
            break;
    }
    
    [UIView animateWithDuration:10.0 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationCurveLinear animations:^{
        
        CGAffineTransform translationTransform = CGAffineTransformMakeTranslation(randomTranslationValueX, randomTranslationValueY);
        CGFloat randomScaleTransformValue = 1.0f;
        CGAffineTransform scaleTransform = CGAffineTransformMakeScale(randomScaleTransformValue, randomScaleTransformValue);
        self.bgImage.transform = CGAffineTransformConcat(scaleTransform, translationTransform);
    } completion:^(BOOL finished) {
        NSLog(@"%ld----%ld---%f--%f",(long)randomTranslationValueX,(long)randomTranslationValueY,self.bgImage.frame.origin.x,self.bgImage.frame.origin.y);
        [self performSelector:@selector(animate) withObject:nil afterDelay:CGFLOAT_MIN];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
