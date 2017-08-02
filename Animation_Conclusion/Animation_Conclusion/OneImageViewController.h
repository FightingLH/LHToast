//
//  OneImageViewController.h
//  Animation_Conclusion
//
//  Created by lh on 2017/8/2.
//  Copyright © 2017年 lh. All rights reserved.
//
//常规属性
//UIViewAnimationOptionLayoutSubviews：动画过程中保证子视图跟随运动。
//
//UIViewAnimationOptionAllowUserInteraction：动画过程中允许用户交互。
//
//UIViewAnimationOptionBeginFromCurrentState：所有视图从当前状态开始运行。
//
//UIViewAnimationOptionRepeat：重复运行动画。
//
//UIViewAnimationOptionAutoreverse ：动画运行到结束点后仍然以动画方式回到初始点。
//
//UIViewAnimationOptionOverrideInheritedDuration：忽略嵌套动画时间设置。
//
//UIViewAnimationOptionOverrideInheritedCurve：忽略嵌套动画速度设置。
//
//UIViewAnimationOptionAllowAnimatedContent：动画过程中重绘视图（注意仅仅适用于转场动画）。
//
//UIViewAnimationOptionShowHideTransitionViews：视图切换时直接隐藏旧视图、显示新视图，而不是将旧视图从父视图移除（仅仅适用于转场动画）
//UIViewAnimationOptionOverrideInheritedOptions ：不继承父动画设置或动画类型。

//速度控制
//UIViewAnimationOptionCurveEaseInOut：动画先缓慢，然后逐渐加速。
//
//UIViewAnimationOptionCurveEaseIn ：动画逐渐变慢。
//
//UIViewAnimationOptionCurveEaseOut：动画逐渐加速。
//
//UIViewAnimationOptionCurveLinear ：动画匀速执行，默认值
#import <UIKit/UIKit.h>

@interface OneImageViewController : UIViewController

@end
