//
//  WYGGradualChangeView.m
//  WYGColorChange
//
//  Created by agon on 2017/7/5.
//  Copyright © 2017年 agon. All rights reserved.
//

#import "WYGGradualChangeView.h"

#define UIColorFromHEX(rgbValue)    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface WYGGradualChangeView()

@property (strong, nonatomic) CABasicAnimation *gradientAnimation;
@property (strong, nonatomic) CAGradientLayer  *gradientLayer;

@end

@implementation WYGGradualChangeView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.colors = @[(__bridge id)UIColorFromHEX(0xFF873E).CGColor,
                                  (__bridge id)UIColorFromHEX(0xFF734D).CGColor,
                                  (__bridge id)UIColorFromHEX(0xFF6461).CGColor
                                  ];
        _gradientLayer.startPoint = CGPointMake(1, 0);
        _gradientLayer.endPoint = CGPointMake(0, 1);
        _gradientLayer.frame = self.bounds;
        [self.layer addSublayer:_gradientLayer];
    }
    return self;
}

- (void)setGradientColors:(NSArray *)gradientColors
{
    if (!gradientColors) {
        return;
    }
    
    _gradientColors = gradientColors;
//    _gradientLayer.colors = gradientColors;
//    _gradientLayer.startPoint = CGPointMake(0, 0);
//    _gradientLayer.endPoint = CGPointMake(1, 1);
//    _gradientLayer.locations =
    
    id fromValue = self.gradientAnimation.toValue;
    CAGradientLayer *presentGradientLayer = _gradientLayer.presentationLayer;
    if (presentGradientLayer) {
        fromValue = presentGradientLayer.colors;
    }
    
    self.gradientAnimation.fromValue = fromValue;
    self.gradientAnimation.toValue = _gradientColors;
    [_gradientLayer addAnimation:self.gradientAnimation forKey:self.gradientAnimation.keyPath];
}

- (CABasicAnimation *)gradientAnimation
{
    if (!_gradientAnimation) {
        _gradientAnimation = [CABasicAnimation animationWithKeyPath:@"colors"];
        _gradientAnimation.removedOnCompletion = NO;
        _gradientAnimation.fillMode = kCAFillModeForwards;
        _gradientAnimation.duration = 0.7;
    }
    
    return _gradientAnimation;
}

@end
