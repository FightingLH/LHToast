//
//  LHScrollView.h
//  Animation_Conclusion
//
//  Created by lh on 2017/7/20.
//  Copyright © 2017年 lh. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ImageViewClick)(NSInteger index);
@interface LHScrollView : UIView
@property (nonatomic,assign)BOOL isRunloop;//是否开启定时器 default NO
@property (nonatomic,assign)NSTimeInterval dur; //default 3
@property (nonatomic,strong)UIColor *color_pageControl;
@property (nonatomic,strong)UIColor *color_currentPageControl;
@property (nonatomic,copy)ImageViewClick click;
- (instancetype)initWithFrame:(CGRect)frame
                   withImages:(NSArray *)images
                withIsRunloop:(BOOL)isRunloop
                    withBlock:(ImageViewClick)block;
@end
