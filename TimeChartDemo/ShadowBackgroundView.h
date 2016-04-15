//
//  ShadowBackgroundView.h
//  lingpao
//
//  Created by wzzyinqiang on 15/8/24.
//  Copyright (c) 2015年 wzzyinqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShadowBackgroundView : UIView

@property (nonatomic, assign) CGFloat red_start_shadow_color;
@property (nonatomic, assign) CGFloat green_start_shadow_color;
@property (nonatomic, assign) CGFloat blue_start_shadow_color;

@property (nonatomic, assign) CGFloat red_end_shadow_color;
@property (nonatomic, assign) CGFloat green_end_shadow_color;
@property (nonatomic, assign) CGFloat blue_end_shadow_color;

- (void)change_start_shadow_back_color:(CGFloat)red_shadow_color green_shadow_color:(CGFloat)green_shadow_color blue_shadow_color:(CGFloat)blue_shadow_color;

- (void)change_end_shadow_back_color:(CGFloat)red_shadow_color green_shadow_color:(CGFloat)green_shadow_color blue_shadow_color:(CGFloat)blue_shadow_color;

@end
