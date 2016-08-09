//
//  animationView.m
//  keyFrameAnimation
//
//  Created by ppzc on 16/8/10.
//  Copyright © 2016年 ppzc. All rights reserved.
//

#import "animationView.h"

@interface animationView()
{
    CGRect _frame;
}
@end
@implementation animationView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGFloat width = CGRectGetWidth(_frame);
    CGFloat height = CGRectGetHeight(_frame);

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, 3);  //线宽
    CGContextSetAllowsAntialiasing(context, true);
    CGContextSetRGBStrokeColor(context, 255.0 / 255.0, 0, 0, 1.0);  //线的颜色
    CGContextBeginPath(context);
    
    CGContextMoveToPoint(context, 0, 0);  //起点坐标
    CGContextAddLineToPoint(context, width, height);   //终点坐标
    
    CGContextMoveToPoint(context, width, 0);
    CGContextAddLineToPoint(context, 0, height);
    
    CGContextStrokePath(context);
}
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _frame = frame;
    }
    return self;
}


@end
