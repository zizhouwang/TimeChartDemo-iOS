//
//  TimeChartView.h
//  lingpao
//
//  Created by wzzyinqiang on 15/8/24.
//  Copyright (c) 2015年 wzzyinqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeChartView : UIView

/** 计时器计时时间*/
@property (nonatomic, assign) CGFloat draw_time;

/** 开始绘图 or 开始重新绘图*/
- (void)start_draw_round;

/** 复位计时器*/
- (void)reset_draw_round;

/** 暂停绘图*/
- (void)stop_draw_round;

/** 继续绘图*/
- (void)continue_draw_round;

@end
