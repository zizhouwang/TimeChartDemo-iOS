//
//  ViewController.m
//  TimeChartDemo
//
//  Created by wzzyinqiang on 16/4/15.
//  Copyright © 2016年 wzzyinqiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.time_chart_view.draw_time = 30.0f;//默认是60s
    
    self.time_chart_view.backgroundColor = [UIColor clearColor];
    
    
    UIButton * start_button = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, ScreenHeight - 120.0f, ScreenWidth / 2.0f, 60.0f)];
    
    start_button.backgroundColor = [UIColor grayColor];
    
    [start_button addTarget:self action:@selector(start_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [start_button setTitle:@"开始" forState:UIControlStateNormal];
    
    [self.view addSubview:start_button];
    
    
    UIButton * reset_button = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth / 2.0f, ScreenHeight - 120.0f, ScreenWidth / 2.0f, 60.0f)];
    
    reset_button.backgroundColor = [UIColor grayColor];
    
    [reset_button addTarget:self action:@selector(reset_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [reset_button setTitle:@"复位" forState:UIControlStateNormal];
    
    [self.view addSubview:reset_button];
    
    
    UIButton * continue_button = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, ScreenHeight - 60.0f, ScreenWidth / 2.0f, 60.0f)];
    
    continue_button.backgroundColor = [UIColor grayColor];
    
    [continue_button addTarget:self action:@selector(continue_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [continue_button setTitle:@"继续" forState:UIControlStateNormal];
    
    [self.view addSubview:continue_button];
    
    
    UIButton * stop_button = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth / 2.0f, ScreenHeight - 60.0f, ScreenWidth / 2.0f, 60.0f)];
    
    stop_button.backgroundColor = [UIColor grayColor];
    
    [stop_button addTarget:self action:@selector(stop_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [stop_button setTitle:@"暂停" forState:UIControlStateNormal];
    
    [self.view addSubview:stop_button];
    
    
    [self.time_chart_view start_draw_round];
}

- (void)start_button_clicked:(UIButton*)button {
    [self.time_chart_view start_draw_round];
}

- (void)reset_button_clicked:(UIButton*)button {
    [self.time_chart_view reset_draw_round];
}

- (void)continue_button_clicked:(UIButton*)button {
    [self.time_chart_view continue_draw_round];
}

- (void)stop_button_clicked:(UIButton*)button {
    [self.time_chart_view stop_draw_round];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
