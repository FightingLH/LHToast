//
//  LHSpreadTransition.h
//  Animation_Conclusion
//
//  Created by lh on 2017/8/8.
//  Copyright © 2017年 lh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, XWCircleSpreadTransitionType) {
    XWCircleSpreadTransitionTypePresent = 0,
    XWCircleSpreadTransitionTypeDismiss
};
@interface LHSpreadTransition : NSObject<UIViewControllerAnimatedTransitioning,CAAnimationDelegate>

@property (nonatomic, assign) XWCircleSpreadTransitionType type;
+ (instancetype)transitionWithTransitionType:(XWCircleSpreadTransitionType)type;
- (instancetype)initWithTransitionType:(XWCircleSpreadTransitionType)type;
@end
