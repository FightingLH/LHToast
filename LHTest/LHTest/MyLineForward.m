//
//  MyLineForward.m
//  LHTest
//
//  Created by lh on 16/9/7.
//  Copyright © 2016年 lh. All rights reserved.
//

#import "MyLineForward.h"

@implementation MyLineForward

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
-(void)drawRect:(CGRect)rect{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context,
                          3.0);
    CGContextSetStrokeColorWithColor(context,[UIColor redColor].CGColor);
    CGContextMoveToPoint(context, CGPointMake(150, [UIScreen mainScreen].bounds.size.height-65).x, CGPointMake(150, [UIScreen mainScreen].bounds.size.height-65).y);//设置Path的起点
    CGContextAddQuadCurveToPoint(context,  CGPointMake([UIScreen mainScreen].bounds.size.width+10, [UIScreen mainScreen].bounds.size.height-150).x, CGPointMake([UIScreen mainScreen].bounds.size.width+10, [UIScreen mainScreen].bounds.size.height-150).y, CGPointMake(195, [UIScreen mainScreen].bounds.size.height-230).x, CGPointMake(195, [UIScreen mainScreen].bounds.size.height-230).y);
     CGContextAddQuadCurveToPoint(context, CGPointMake(60, 320).x, CGPointMake(60, 320).y, CGPointMake(95, 230).x, CGPointMake(95, 230).y);
    CGContextAddQuadCurveToPoint(context, CGPointMake(320,60).x, CGPointMake(320, 60).y, CGPointMake(230, 95).x, CGPointMake(230, 95).y);
    CGContextStrokePath(context);
    
}
@end
