//
//  AnimationHandler.m
//  keyFrameAnimation
//
//  Created by ppzc on 16/8/10.
//  Copyright © 2016年 ppzc. All rights reserved.
//

#import "AnimationHandler.h"

static AnimationHandler *animationHandler;

@implementation AnimationHandler

+ (instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!animationHandler) {
            animationHandler = [AnimationHandler new];
        }
    });
    
    return animationHandler;
}
//opacity 渐变透明
-(CABasicAnimation *)opacityForever_Animation:(float)time
{
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    
    animation.fromValue=[NSNumber numberWithFloat:1.0];
    
    animation.toValue=[NSNumber numberWithFloat:0.0];
    
    animation.autoreverses=YES;
    
    animation.duration=time;
    
    animation.repeatCount=FLT_MAX;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    return animation;
}


-(CABasicAnimation *)opacityOnceTime_Animation:(float)time
{
    CABasicAnimation *animation = [self opacityForever_Animation:time];
    animation.repeatCount = 1;
    return animation;
}

- (CABasicAnimation *)moveX:(float)time X:(NSNumber *)x

{
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    
    animation.toValue=x;
    
    animation.duration=time;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    return animation;
    
}



-(CABasicAnimation *)moveY:(float)time Y:(NSNumber *)y

{
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    
    animation.toValue=y;
    
    animation.duration=time;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    return animation;
    
}

- (CABasicAnimation *)scale:(NSNumber *)Multiple orgin:(NSNumber *)orginMultiple durTimes:(float)time Rep:(float)repeatTimes
{
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    animation.fromValue=orginMultiple;
    
    animation.toValue=Multiple;
    
    animation.duration=time;
    
    animation.autoreverses=YES;
    
    animation.repeatCount=repeatTimes;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    return animation;
    
}

- (CABasicAnimation *)rotation:(float)dur degree:(float)degree direction:(int)direction repeatCount:(int)repeatCount
{
    
    CATransform3D rotationTransform  = CATransform3DMakeRotation(degree, 0, 0,direction);
    
    CABasicAnimation* animation;
    
    animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    
    
    animation.toValue= [NSValue valueWithCATransform3D:rotationTransform];
    
    animation.duration= dur;
    
    animation.autoreverses= NO;
    
    animation.cumulative= YES;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    animation.repeatCount= repeatCount;
    
    animation.delegate= self;
    
    
    
    return animation;
    
}

-(CAAnimationGroup *)groupAnimation:(NSArray *)animationAry durTimes:(float)time Rep:(float)repeatTimes

{
    
    CAAnimationGroup *animation=[CAAnimationGroup animation];
    
    animation.animations=animationAry;
    
    animation.duration=time;
    
    animation.repeatCount=repeatTimes;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    return animation;
    
}

- (CAKeyframeAnimation *)keyframeAniamtion:(CGMutablePathRef)path durTimes:(float)time Rep:(float)repeatTimes
{
    
    CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    animation.path=path;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    animation.autoreverses=NO;
    
    animation.duration=time;
    
    animation.repeatCount=repeatTimes;
    
    return animation;
    
}



- (CABasicAnimation *)movepoint:(CGPoint )point

{
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.translation"];
    
    animation.toValue=[NSValue valueWithCGPoint:point];
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    return animation;
    
}

//    CGPoint
//    p1=CGPointMake(50, 120);
//    CGPoint
//    p2=CGPointMake(80, 170);
//    CGPoint
//    p3=CGPointMake(30, 100);
//    CGPoint
//    p4=CGPointMake(100, 190);
//    CGPoint
//    p5=CGPointMake(200, 10);
//    NSArray
//    *values=[NSArray arrayWithObjects:[NSValue valueWithCGPoint:p1],[NSValue valueWithCGPoint:p2],[NSValue valueWithCGPoint:p3],[NSValue valueWithCGPoint:p4],[NSValue valueWithCGPoint:p5], nil];
//    CAKeyframeAnimation
//    *animation
//    = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    animation.repeatCount = FLT_MAX;
//    [animation setValues:values];
//    [animation
//     setDuration:3.0];
//    [animation
//     setAutoreverses:NO];
//    [self.layer
//     addAnimation:animation forKey:NULL];
//}



@end
