//
//  ViewController.m
//  WYGColorChange
//
//  Created by agon on 2017/7/5.
//  Copyright © 2017年 agon. All rights reserved.
//

#import "ViewController.h"
#import "WYGGradualChangeView.h"
#import "UIView+addGradualLayer.h"

#define UIColorFromHEX(rgbValue)    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ViewController ()

@property (strong, nonatomic) WYGGradualChangeView *colorView;

@end

@implementation ViewController{
    NSArray *_gradientColors1;
    NSArray *_gradientColors2;
    NSArray *_gradientColors3;
}

- (IBAction)sliderChange:(id)sender {
    UISlider *slider = (UISlider *)sender;
    NSLog(@"%.f",slider.value);
    if (slider.value>0 && slider.value <0.4) {
        self.colorView.gradientColors = _gradientColors1;
    }else if(slider.value >=0.4 && slider.value < 0.7){
        self.colorView.gradientColors = _gradientColors2;
    }else {
        self.colorView.gradientColors = _gradientColors3;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"渐变色";
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 400, 100, 100)];
    [button setTitle:@"点击按钮" forState:UIControlStateNormal];
    
    [button addGradualLayerWithColors:@[(__bridge id)UIColorFromHEX(0xA442D7).CGColor,
                              (__bridge id)UIColorFromHEX(0xDB58A1).CGColor,
                              (__bridge id)UIColorFromHEX(0xFF7367).CGColor
                              ]];
    [self.view addSubview:button];
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(220, 400, 100, 100)];
    textLabel.text = @"UILabel";
    textLabel.textColor = [UIColor whiteColor];
    [textLabel addGradualLayerWithColors:@[(__bridge id)UIColorFromHEX(0x00E4FC).CGColor,
                                 (__bridge id)UIColorFromHEX(0x4AA2FB).CGColor,
                                 (__bridge id)UIColorFromHEX(0xFF7367).CGColor]];
    [self.view addSubview:textLabel];
    
//    _gradientColors1 = @[(__bridge id)UIColorFromHEX(0xFF873E).CGColor,
//                         (__bridge id)UIColorFromHEX(0xFF734D).CGColor,
//                         (__bridge id)UIColorFromHEX(0xFF6461).CGColor
//                         ];
//    _gradientColors2 = @[(__bridge id)UIColorFromHEX(0xA442D7).CGColor,
//                         (__bridge id)UIColorFromHEX(0xDB58A1).CGColor,
//                         (__bridge id)UIColorFromHEX(0xFF7367).CGColor
//                         ];
//    _gradientColors3 = @[(__bridge id)UIColorFromHEX(0x00E4FC).CGColor,
//                         (__bridge id)UIColorFromHEX(0x4AA2FB).CGColor,
//                         (__bridge id)UIColorFromHEX(0x7061F8).CGColor
//                         ];
//    
//    self.colorView = [[WYGGradualChangeView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 400)];
//    self.colorView.gradientColors = _gradientColors1;
//    [self.view addSubview:self.colorView];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
