//
//  TimeChartView.h
//  lingpao
//
//  Created by wzzyinqiang on 15/8/24.
//  Copyright (c) 2015年 wzzyinqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeChartView : UIView

@property (nonatomic, assign) BOOL start_drawing;

@property (nonatomic, assign) CGFloat drawing_time;

@property (nonatomic, strong) NSTimer * draw_timer;

@property (nonatomic, strong) UIButton * time_button;

- (void)start_draw_round;

@end
