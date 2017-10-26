//
//  ExpandAimation.m
//  ExpandAnimation
//
//  Created by 田向阳 on 2017/10/25.
//  Copyright © 2017年 田向阳. All rights reserved.
//

#import "ExpandAimation.h"

@interface ExpandAimation ()<CAAnimationDelegate>

@property (nonatomic, weak) UIView *animationView;

@end

@implementation ExpandAimation

- (void)startAnimationInView:(UIView *)animationView
{
    if (!animationView) {
        return;
    }
    self.animationView = animationView;
    CGFloat width = CGRectGetWidth(animationView.frame);
    CGFloat height = CGRectGetHeight(animationView.frame);
    CGFloat radius = height/2;
    CGRect myRect = CGRectMake((width - radius)/2, (height - radius)/2, radius, radius);
        //background
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:animationView.bounds cornerRadius:0];
        //circle
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:myRect];
    [path appendPath:circlePath];
    [path setUsesEvenOddFillRule:YES];
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    circleLayer.path = path.CGPath;
    circleLayer.frame = animationView.bounds;
    circleLayer.fillRule = kCAFillRuleEvenOdd;  // key code 
    circleLayer.fillColor = [UIColor blackColor].CGColor;
    circleLayer.opacity = 0;
    animationView.layer.masksToBounds = YES;
    [animationView.layer addSublayer:circleLayer];
        //    layer.scale
    CABasicAnimation *expandAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    expandAnimation.fromValue = @(1);
    expandAnimation.toValue = @(10);
    expandAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        //    layer.opacity
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = @(0.6);
    opacityAnimation.toValue = @(0);
    opacityAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[expandAnimation, opacityAnimation];
    groupAnimation.delegate = self;
    groupAnimation.duration = 10;
    groupAnimation.removedOnCompletion = YES;

    [circleLayer addAnimation:groupAnimation forKey:@"animation"];
}


- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [self.animationView.layer.sublayers.lastObject removeFromSuperlayer];
}

@end
