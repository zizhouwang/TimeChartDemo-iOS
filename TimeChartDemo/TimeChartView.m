//
//  TimeChartView.m
//  lingpao
//
//  Created by wzzyinqiang on 15/8/24.
//  Copyright (c) 2015年 wzzyinqiang. All rights reserved.
//

#import "TimeChartView.h"
#import <math.h>
#import "Macros.h"

@implementation TimeChartView

- (id)init {
    self = [super init];
    
    if (self) {
        [self initControl];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
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
    self.draw_timer = [NSTimer timerWithTimeInterval:0.1f target:self selector:@selector(drawing_round) userInfo:nil repeats:YES];
    
    
    self.time_button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenWidth)];
    
    [self addSubview:self.time_button];
    
    
    
    [self.time_button setTitle:@"00:00" forState:UIControlStateNormal];
    
    self.time_button.titleLabel.font = [UIFont systemFontOfSize:40.0f];
    
    
    [self start_draw_round];
}

- (void)drawRect:(CGRect)rect {
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(context, COLOR_RGBA(141, 255, 254, 1.0f).CGColor);
    
    CGFloat actual_width = ScreenWidth / 2.0f;//如果你是用故事版使用这个类 那么这里一定要输入该类实际的width
    
    CGFloat actual_height = actual_width * 2.0f;
    
    CGFloat start_x_coordinate = actual_width;
    
    CGFloat start_y_coordinate = actual_height / 2.0f;
    
    CGContextMoveToPoint(context, start_x_coordinate, start_y_coordinate);
    
    for (NSInteger i = 0; i < 31; i++) {
        CGFloat x_coordinate = cos(i * M_PI_2 / 30.0f) * actual_height / 2.0f;
        
        CGFloat y_coordinate = sin(i * M_PI_2 / 30.0f) * actual_height / 2.0f;
        
        
        CGContextMoveToPoint(context, start_x_coordinate + x_coordinate * 94.0f / 106.0f, start_y_coordinate + y_coordinate * 94.0f / 106.0f);
        
        CGContextAddLineToPoint(context, start_x_coordinate + x_coordinate, start_y_coordinate + y_coordinate);
        
        CGContextStrokePath(context);
        
        CGContextMoveToPoint(context, start_x_coordinate, start_y_coordinate);
        
        
        CGContextMoveToPoint(context, start_x_coordinate - x_coordinate * 94.0f / 106.0f, start_y_coordinate + y_coordinate * 94.0f / 106.0f);
        
        CGContextAddLineToPoint(context, start_x_coordinate - x_coordinate, start_y_coordinate + y_coordinate);
        
        CGContextStrokePath(context);
        
        CGContextMoveToPoint(context, start_x_coordinate, start_y_coordinate);
        
        
        CGContextMoveToPoint(context, start_x_coordinate + x_coordinate * 94.0f / 106.0f, start_y_coordinate - y_coordinate * 94.0f / 106.0f);
        
        CGContextAddLineToPoint(context, start_x_coordinate + x_coordinate, start_y_coordinate - y_coordinate);
        
        CGContextStrokePath(context);
        
        CGContextMoveToPoint(context, start_x_coordinate, start_y_coordinate);
        
        
        CGContextMoveToPoint(context, start_x_coordinate - x_coordinate * 94.0f / 106.0f, start_y_coordinate - y_coordinate * 94.0f / 106.0f);
        
        CGContextAddLineToPoint(context, start_x_coordinate - x_coordinate, start_y_coordinate - y_coordinate);
        
        CGContextStrokePath(context);
        
        CGContextMoveToPoint(context, start_x_coordinate, start_y_coordinate);
    }
    
    CGContextMoveToPoint(context, start_x_coordinate, start_y_coordinate - actual_height / 2.0f * 74.0f / 106.0f);
    
    CGContextSetLineWidth(context, 4.0f);
    
    //设置线条起点和终点的样式为方的
    CGContextSetLineCap(context, kCGLineCapSquare);
    
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    
    CGContextAddArc(context, start_x_coordinate, start_y_coordinate, actual_height / 2.0f * 74.0f / 106.0f, -M_PI_2, M_PI_2 * 3, 0);
    
    //渲染
    CGContextStrokePath(context);
    
    if (self.start_drawing) {
        //设置线条起点和终点的样式为圆角
        CGContextSetLineCap(context, kCGLineCapRound);
        
        CGContextSetStrokeColorWithColor(context, COLOR_RGBA(89, 233, 214, 1.0f).CGColor);
        
        CGContextAddArc(context, start_x_coordinate, start_y_coordinate, actual_height / 2.0f * 74.0f / 106.0f, -M_PI_2, -M_PI_2 + self.drawing_time * 2.0f * M_PI / 60.0f, 0);
    }
    
    //渲染
    CGContextStrokePath(context);
    
    //设置线条起点和终点的样式为圆角
    CGContextSetLineCap(context, kCGLineCapSquare);
    
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    
    CGFloat angle = self.drawing_time * 2 * M_PI / 60.0f + M_PI * 1.5f;
    
    CGFloat triangle_out_radius = actual_height / 2.0f * 64.0f / 106.0f;
    
    CGFloat triangle_inside_radius = actual_height / 2.0f * 56.0f / 106.0f;
    
    CGPoint triangle_point = CGPointMake(start_x_coordinate + cos(angle) * triangle_inside_radius, start_y_coordinate + sin(angle) * triangle_inside_radius);
    
    CGPoint triangle_point1 = CGPointMake(start_x_coordinate + cos(angle) * triangle_out_radius, start_y_coordinate + sin(angle) * triangle_out_radius);
    
    CGContextMoveToPoint(context, triangle_point.x, triangle_point.y);
    
    
    
    CGFloat triangle_radius = 5.0f;
    
    CGFloat left_angle = angle - M_PI_2;
    
    CGPoint triangle_point2 = CGPointMake(triangle_point.x + cos(left_angle) * triangle_radius, triangle_point.y + sin(left_angle) * triangle_radius);
    
    
    
    CGFloat right_angle = angle + M_PI_2;
    
    CGPoint triangle_point3 = CGPointMake(triangle_point.x + cos(right_angle) * triangle_radius, triangle_point.y + sin(right_angle) * triangle_radius);
    
    
    
    CGPoint triangle_points[4];
    
    triangle_points[0] = triangle_point1;
    
    triangle_points[1] = triangle_point2;
    
    triangle_points[2] = triangle_point3;
    
    triangle_points[3] = triangle_point1;
    
    CGContextAddLines(context, triangle_points, 4);
    
    CGContextDrawPath(context, kCGPathFill);
    
    
    
    //渲染
    CGContextStrokePath(context);
}

- (void)start_draw_round {
    self.drawing_time = 0.0f;
    
    [[NSRunLoop currentRunLoop] addTimer:self.draw_timer forMode:NSDefaultRunLoopMode];
    
    self.start_drawing = YES;
}

- (void)drawing_round {
    if (self.drawing_time > 60.0f) {
        [self.draw_timer invalidate];
        
        self.start_drawing = NO;
        
        return;
    }
    
    [self setNeedsDisplay];
    
    [self.time_button setTitle:[NSString stringWithFormat:@"00:%02li",(long)self.drawing_time + 1] forState:UIControlStateNormal];
    
    self.drawing_time += 0.1f;
}

@end
