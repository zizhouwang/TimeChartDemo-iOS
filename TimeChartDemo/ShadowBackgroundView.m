//
//  ShadowBackgroundView.m
//  lingpao
//
//  Created by wzzyinqiang on 15/8/24.
//  Copyright (c) 2015年 wzzyinqiang. All rights reserved.
//

#import "ShadowBackgroundView.h"
#import "Macros.h"

@implementation ShadowBackgroundView

- (id)init {
    self = [super init];
    
    if (self) {
        [self initControl];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    
    if (self) {
        [self initControl];
    }
    return self;
    
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self initControl];
    }
    
    return self;
}

- (void)initControl {
    self.red_start_shadow_color = 0.0f;
    
    self.green_start_shadow_color = 234.0f;
    
    self.blue_start_shadow_color = 239.0f;
    
    
    self.red_end_shadow_color = 0.0f;
    
    self.green_end_shadow_color = 196.0f;
    
    self.blue_end_shadow_color = 201.0f;
}

- (void)change_start_shadow_back_color:(CGFloat)red_shadow_color green_shadow_color:(CGFloat)green_shadow_color blue_shadow_color:(CGFloat)blue_shadow_color {
    self.red_start_shadow_color = red_shadow_color;
    
    self.green_start_shadow_color = green_shadow_color;
    
    self.blue_start_shadow_color = blue_shadow_color;
    
    [self setNeedsDisplay];
}

- (void)change_end_shadow_back_color:(CGFloat)red_shadow_color green_shadow_color:(CGFloat)green_shadow_color blue_shadow_color:(CGFloat)blue_shadow_color {
    self.red_end_shadow_color = red_shadow_color;
    
    self.green_end_shadow_color = green_shadow_color;
    
    self.blue_end_shadow_color = blue_shadow_color;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
//    CGContextClip(context);
    
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGFloat colors[] =
    {
        self.red_start_shadow_color / 255.0, self.green_start_shadow_color / 255.0, self.blue_start_shadow_color / 255.0, 1.00,
        self.red_end_shadow_color / 255.0,  self.green_end_shadow_color / 255.0, self.blue_end_shadow_color / 255.0, 1.00,
    };
    
    CGGradientRef gradient = CGGradientCreateWithColorComponents(rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));
    
    CGColorSpaceRelease(rgb);
    
    CGContextDrawLinearGradient(context, gradient,CGPointMake(0.0,0.0) ,CGPointMake(self.frame.size.width,self.frame.size.height), kCGGradientDrawsBeforeStartLocation);
}

@end
