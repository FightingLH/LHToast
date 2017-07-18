//
//  TransitionsViewController.m
//  Animation_Conclusion
//
//  Created by lh on 2017/7/18.
//  Copyright © 2017年 lh. All rights reserved.
//

#import "TransitionsViewController.h"
#import "CustomPopAnimation.h"

@interface TransitionsViewController ()<UINavigationControllerDelegate>
@property  (nonatomic, strong) CustomPopAnimation *customPop;
@end

@implementation TransitionsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"转场动画-push-自定义动画效果";
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
}

- (void)back
{
    self.navigationController.delegate = self;
    self.customPop = [[CustomPopAnimation alloc]init];
    [self.navigationController popViewControllerAnimated:YES];
}

- (id<UIViewControllerAnimatedTransitioning>) navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        return nil;
    }else if (operation == UINavigationControllerOperationPop) {
        return self.customPop;
    }else{
        return nil;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
