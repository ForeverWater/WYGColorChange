//
//  UIView+addGradualLayer.m
//  WYGColorChange
//
//  Created by agon on 2017/7/5.
//  Copyright © 2017年 agon. All rights reserved.
//

#import "UIView+addGradualLayer.h"

#define UIColorFromHEX(rgbValue)    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@implementation UIView (addGradualLayer)

-(void)addGradualLayerWithColors:(NSArray *)colors {
    CAGradientLayer *_gradientLayer = [CAGradientLayer layer];

    _gradientLayer.startPoint = CGPointMake(1, 0);//第一个颜色开始渐变的位置
    _gradientLayer.endPoint = CGPointMake(0, 1);//最后一个颜色结束的位置
    _gradientLayer.frame = self.bounds;//设置渐变图层的大小
    if (colors == nil) {
        //颜色为空时预置的颜色
        _gradientLayer.colors = @[(__bridge id)UIColorFromHEX(0xFF873E).CGColor,
                                  (__bridge id)UIColorFromHEX(0xFF734D).CGColor,
                                  (__bridge id)UIColorFromHEX(0xFF6461).CGColor
                                  ];
    }else {
        _gradientLayer.colors = colors;
    }
    
        [self.layer insertSublayer:_gradientLayer atIndex:0];
}

@end
