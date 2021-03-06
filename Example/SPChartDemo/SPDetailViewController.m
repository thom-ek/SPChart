//
//  SPDetailViewController.m
//  SPChartDemo
//
//  Created by Alessandro Calzavara on 13/06/14.
//  Copyright (c) 2014 Alessandro Calzavara. All rights reserved.
//

#import "SPDetailViewController.h"

#import "SPChart.h"

#define Color1  [UIColor colorWithRed:247.0 / 255.0 green:221.0 / 255.0 blue:0.0 / 255.0 alpha:1.0f]
#define Color2  [UIColor colorWithRed:207.0 / 255.0 green:171.0 / 255.0 blue:0.0 / 255.0 alpha:1.0f]
#define Color3  [UIColor colorWithRed:155.0 / 255.0 green:137.0 / 255.0 blue:19.0 / 255.0 alpha:1.0f]
#define Color4  [UIColor colorWithRed:153.0 / 255.0 green:153.0 / 255.0 blue:153.0 / 255.0 alpha:1.0f]

#define CHART_FRAME CGRectMake(0, 64, 320, CGRectGetHeight(self.view.bounds)-64)

@interface SPDetailViewController ()
@property (weak, nonatomic) SPLineChart * lineChart1;
@property (weak, nonatomic) SPBarChart * barChart2;
@property (weak, nonatomic) SPBarChart * barChart3;
@property (weak, nonatomic) SPPieChart * pieChart1;

@property (weak, nonatomic) SPChartPopup * popup;
@end

@implementation SPDetailViewController

- (void)showLineChart1
{
    self.navigationItem.title = @"Line Chart";
    
    SPLineChart * chart = [[SPLineChart alloc] initWithFrame:CHART_FRAME];
    chart.yLabelCount = 7;
    
    [chart setDatas:@[
                      [SPLineChartData dataWithValues:@[ @(0), @(-2), @1, @0, @3, @2 ] color:Color1],
                      [SPLineChartData dataWithValues:@[ @0, @1, @3, @2, @5, @4 ] color:Color2]
                      ]
         forXValues:@[
                      @"GEN",
                      @"FEB",
                      @"MAR",
                      @"APR",
                      @"MAY",
                      @"JUN"
                      ]];
    
    
    // Show empty message, if the chart is empty
    chart.emptyChartText = @"The chart is empty.";
    
    //change xLabels orientation
    chart.xLabelsOrientationAngle = -M_PI / 2;
    
    [self.view addSubview:chart];
    
    [chart drawChart];
    
    chart.delegate = self;
    self.lineChart1 = chart;
}

- (void)showBarChart1
{
    self.navigationItem.title = @"Bar Chart";
    
    SPBarChart * chart = [[SPBarChart alloc] initWithFrame:CHART_FRAME];
    
    [chart setDatas:@[
                      [SPBarChartData dataWithValue:1 color:Color1 description:@"SEP 1"],
                      [SPBarChartData dataWithValue:24 color:Color1 description:@"SEP 2"],
                      [SPBarChartData dataWithValue:12 color:Color1 description:@"SEP 3"],
                      [SPBarChartData dataWithValue:18 color:Color1 description:@"SEP 4"],
                      [SPBarChartData dataWithValue:30 color:Color1 description:@"SEP 5"],
                      [SPBarChartData dataWithValue:10 color:Color1 description:@"SEP 6"],
                      [SPBarChartData dataWithValue:21 color:Color1 description:@"SEP 7"],
                      ]];
    
    
    // Show axis
    chart.showAxis = YES;
    // and section lines inside
    chart.showSectionLines = YES;
    
    // Show empty message, if the chart is empty
    chart.emptyChartText = @"The chart is empty.";
    
    [self.view addSubview:chart];
    
    [chart drawChart];
}

- (void)showBarChart2
{
    SPBarChart * chart = [[SPBarChart alloc] initWithFrame:CHART_FRAME];
    
    NSArray * colors = @[ Color1, Color2, Color3 ];
    
    [chart setDatas:@[
                      [SPBarChartData dataWithValues:@[ @94,  @21, @30 ] colors:colors description:@"GEN"],
                      [SPBarChartData dataWithValues:@[ @71,  @20, @10 ] colors:colors description:@"FEB"],
                      [SPBarChartData dataWithValues:@[ @44,  @0 , @50 ] colors:colors description:@"MAR"],
                      [SPBarChartData dataWithValues:@[ @127, @21, @8  ] colors:colors description:@"APR"],
                      [SPBarChartData dataWithValues:@[ @18,  @22, @0  ] colors:colors description:@"MAY"],
                      [SPBarChartData dataWithValues:@[ @163, @0 , @42 ] colors:colors description:@"JUN"],
                      [SPBarChartData dataWithValues:@[ @125, @9 , @20 ] colors:colors description:@"JUL"],
                      ]];
    
    // Set maximum value
    chart.maxDataValue = 210;
    
    // Show axis
    chart.showAxis = YES;
    // and section lines inside
    chart.showSectionLines = YES;
    
    // Show empty message, if the chart is empty
    chart.emptyChartText = @"The chart is empty.";
    
    [self.view addSubview:chart];
    
    [chart drawChart];
    
    chart.delegate = self;
    self.barChart2 = chart;
}

- (void)showBarChart3
{
    SPBarChart * chart = [[SPBarChart alloc] initWithFrame:CHART_FRAME];
    
    NSArray * colors = @[ Color2 ];
    
    [chart setDatas:@[
                      [SPBarChartData dataWithValues:@[ @94, ] colors:colors description:@"GEN"],
                      [SPBarChartData dataWithValues:@[ @71, ] colors:colors description:@"FEB"],
                      [SPBarChartData dataWithValues:@[ @44, ] colors:colors description:@"MAR"],
                      [SPBarChartData dataWithValues:@[ @127 ] colors:colors description:@"APR"],
                      [SPBarChartData dataWithValues:@[ @18  ] colors:colors description:@"MAY"],
                      [SPBarChartData dataWithValues:@[ @163 ] colors:colors description:@"JUN"],
                      [SPBarChartData dataWithValues:@[ @125 ] colors:colors description:@"JUL"],
                      ]];
    
    // Set maximum value
    chart.maxDataValue = 210;
    chart.upsideDown = YES;
    
    // Show axis
    chart.showAxis = YES;
    // and section lines inside
    chart.showSectionLines = YES;
    
    // Show empty message, if the chart is empty
    chart.emptyChartText = @"The chart is empty.";
    
    [self.view addSubview:chart];
    
    [chart drawChart];
    
    chart.delegate = self;
    self.barChart3 = chart;
}

- (void)showPieChart1
{
    self.navigationItem.title = @"Pie Chart";
    
    SPPieChart * chart = [[SPPieChart alloc] initWithFrame:CHART_FRAME];
    
    [chart setDatas:@[
                      [SPPieChartData dataWithValue:10 color:Color1],
                      [SPPieChartData dataWithValue:20 color:Color2 description:@"WWDC"],
                      [SPPieChartData dataWithValue:40 color:Color3 description:@"GOOL I/O"],
                      ]];
    
    // Show empty message, if the chart is empty
    chart.emptyChartText = @"The chart is empty.";
    
    [self.view addSubview:chart];
    
    [chart drawChart];
    
    chart.delegate = self;
    self.pieChart1 = chart;
}

#pragma mark -
#pragma mark Popup

- (void)_dismissPopup
{
    if (self.popup) {
        [self.popup dismiss];
    }
}

#pragma mark -
#pragma mark SPChartDelegate

- (void)SPChart:(SPLineChart *)chart lineSelected:(NSInteger)lineIndex touchPoint:(CGPoint)point
{
    NSLog(@"Selected line %ld", (long)lineIndex);
    
    [self _dismissPopup];
}

- (void)SPChart:(SPLineChart *)chart lineKeyPointSelected:(NSInteger)pointIndex ofLine:(NSInteger)lineIndex keyPoint:(CGPoint)keyPoint touchPoint:(CGPoint)point
{
    NSLog(@"Selected key point %ld in line %ld", (long)pointIndex, (long)lineIndex);
    
    [self _dismissPopup];
    
    // Show a popup
    SPLineChartData * data = self.lineChart1.datas[lineIndex];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.text = [NSString stringWithFormat:@"%@ %@", data.values[pointIndex], (lineIndex == 0) ? @"visitors" : @"plays"];
    label.font = self.lineChart1.labelFont;
    label.textColor = [UIColor whiteColor];
    [label sizeToFit];
    
    SPChartPopup * popup = [[SPChartPopup alloc] initWithContentView:label];
    [popup setPopupColor:Color4];
    [popup sizeToFit];
    
    [popup showInView:self.lineChart1 withBottomAnchorPoint:keyPoint];
    self.popup = popup;
}

- (void)SPChart:(SPBarChart *)chart barSelected:(NSInteger)barIndex barFrame:(CGRect)barFrame touchPoint:(CGPoint)touchPoint
{
    NSLog(@"Selected bar %ld", (long)barIndex);
    
    [self _dismissPopup];
    
    // Show a popup
    if (chart == self.barChart2) {
        
        SPBarChartData * data = chart.datas[barIndex];
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.text = [NSString stringWithFormat:@"%@ - %@ - %@", data.values[0], data.values[1], data.values[2]];
        label.font = chart.labelFont;
        label.textColor = [UIColor whiteColor];
        
        [label sizeToFit];
        
        SPChartPopup * popup = [[SPChartPopup alloc] initWithContentView:label];
        [popup setPopupColor:Color4];
        [popup sizeToFit];
        
        [popup showInView:chart withBottomAnchorPoint:CGPointMake(CGRectGetMidX(barFrame), CGRectGetMinY(barFrame))];
        self.popup = popup;
    }
    else if (chart == self.barChart3) {
        // Upside down chart
        SPBarChartData * data = chart.datas[barIndex];
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.text = [NSString stringWithFormat:@"%@", data.values[0]];
        label.font = chart.labelFont;
        label.textColor = [UIColor whiteColor];
        
        [label sizeToFit];
        
        SPChartPopup * popup = [[SPChartPopup alloc] initWithContentView:label];
        [popup setPopupColor:Color4];
        [popup sizeToFit];
        
        [popup showInView:chart withTopAnchorPoint:CGPointMake(CGRectGetMidX(barFrame), CGRectGetMaxY(barFrame))];
        self.popup = popup;
    }
}

- (void)SPChart:(SPPieChart *)chart piePieceSelected:(NSInteger)pieceIndex
{
    NSLog(@"Selected piece %ld", (long)pieceIndex);
}

- (void)SPChartEmptySelection:(id)chart
{
    NSLog(@"Touch outside chart bar/line/piece");
    
    [self _dismissPopup];
}

@end
