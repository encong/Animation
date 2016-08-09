//
//  ViewController.m
//  keyFrameAnimation
//
//  Created by ppzc on 16/8/10.
//  Copyright © 2016年 ppzc. All rights reserved.
//

#import "ViewController.h"
#import "animationView.h"
#import "AnimationHandler.h"

@interface ViewController ()
{
    AnimationHandler *_animationHandler;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _animationHandler = [AnimationHandler sharedInstance];

    
    animationView *_animationView = [[animationView alloc] initWithFrame:CGRectMake(100, 100,100, 100)];
    [_animationView setBackgroundColor:[UIColor clearColor]];
    
//    [_animationView.layer addAnimation:[_animationHandler opacityOnceTime_Animation:3] forKey:nil];
//    [_animationView.layer addAnimation:[_animationHandler rotation:1 degree:M_PI_2 direction:3 repeatCount:FLT_MAX] forKey:nil];
    
    [self.view addSubview:_animationView];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
