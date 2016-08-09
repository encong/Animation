//
//  AnimationHandler.h
//  keyFrameAnimation
//
//  Created by ppzc on 16/8/10.
//  Copyright © 2016年 ppzc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AnimationHandler : NSObject

+ (instancetype)sharedInstance;
//渐变
- (CABasicAnimation *)opacityForever_Animation:(float)time;
- (CABasicAnimation *)opacityOnceTime_Animation:(float)time;
//move
- (CABasicAnimation *)moveX:(float)time X:(NSNumber *)x;
-(CABasicAnimation *)moveY:(float)time Y:(NSNumber *)y;
//缩放
- (CABasicAnimation *)scale:(NSNumber *)Multiple orgin:(NSNumber *)orginMultiple durTimes:(float)time Rep:(float)repeatTimes;
//旋转
- (CABasicAnimation *)rotation:(float)dur degree:(float)degree direction:(int)direction repeatCount:(int)repeatCount;
//组合动画
-(CAAnimationGroup *)groupAnimation:(NSArray *)animationAry durTimes:(float)time Rep:(float)repeatTimes;
//路径动画
- (CAKeyframeAnimation *)keyframeAniamtion:(CGMutablePathRef)path durTimes:(float)time Rep:(float)repeatTimes;
//点移动
- (CABasicAnimation *)movepoint:(CGPoint )point;

@end
