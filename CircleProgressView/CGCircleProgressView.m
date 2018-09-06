//
//  CGCircleProgressView.m
//  CoGo
//
//  Created by liuxy on 2018/9/6.
//  Copyright © 2018年 彭文鑫. All rights reserved.
//

#import "CGCircleProgressView.h"


#define degreesToRadians(x) (M_PI*(x)/180.0)
#define PROGRESS_LINE_WIDTH 3 //弧线的宽度

@interface CGCircleProgressView()
{
    CAShapeLayer *_trackLayer;
    CAShapeLayer *_progressLayer;
    
}
@property (nonatomic, strong) CAShapeLayer *trackLayer;

@property (nonatomic, strong) CAShapeLayer *progressLayer;
/** 进度条中间文字  */
@property (nonatomic,   weak)UILabel*lable;
/** 进度 */
@property (nonatomic,assign)CGFloat progress;
/** 定时器 */
@property (nonatomic,strong)NSTimer *timer;

@end

@implementation CGCircleProgressView

/** 画板 */
- (void)drawRect:(CGRect)rect {
    
    // 创建一个track shape layer
    _trackLayer = [CAShapeLayer layer];
    _trackLayer.frame = self.bounds;
    _trackLayer.fillColor = [[UIColor clearColor] CGColor];
    _trackLayer.strokeColor = [[UIColor colorWithHexString:@"#DCDCDC"]  CGColor];
    [self.layer addSublayer:_trackLayer];
    
    // 指定path的渲染颜色
    _trackLayer.opacity = 1; // 背景透明度
    _trackLayer.lineCap = kCALineCapRound;// 指定线的边缘是圆的
    _trackLayer.lineWidth = PROGRESS_LINE_WIDTH; // 线的宽度
    
    
    // 上面说明过了用来构建圆形
    
    /*
     center：圆心的坐标
     radius：半径
     startAngle：起始的弧度
     endAngle：圆弧结束的弧度
     clockwise：YES为顺时针，No为逆时针
     方法里面主要是理解startAngle与endAngle
     */
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
                                                        radius:self.frame.size.width/2
                                                    startAngle:degreesToRadians(270)
                                                      endAngle:degreesToRadians(-90) clockwise:NO];
    
    _trackLayer.path = [path CGPath]; // 把path传递給layer，然后layer会处理相应的渲染，整个逻辑和CoreGraph是一致的。
    _progressLayer = [CAShapeLayer layer];
    _progressLayer.frame = self.bounds;
    _progressLayer.fillColor = [[UIColor clearColor] CGColor];
    _progressLayer.strokeColor = [[UIColor colorWithHexString:@"#E087E8"] CGColor];
    _progressLayer.lineCap = kCALineCapRound;
    _progressLayer.lineWidth = PROGRESS_LINE_WIDTH;
    _progressLayer.path = [path CGPath];
    _progressLayer.opacity = 1;
    _progressLayer.strokeEnd = 0;
    
    [self.layer addSublayer:_progressLayer];
    
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)showInView:(UIView *)parentView
{
    [parentView addSubview:self];
    
    self.frame = CGRectMake(0.f, 0.f, 30, 30);
    self.center = parentView.center;
}

-(void)circularProgressViewStart{
    if (self.timer == nil) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(ChangeCircleValue:) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    }
}

-(void)ChangeCircleValue:(NSTimer *)timer{
    
    if (self.progress >= self.signProgress){
        [self.timer invalidate];
        self.timer = nil;
        // 设置初始值
        return;
    }
    
    self.progress += 0.01;
    _progressLayer.strokeEnd = self.progress;
}

//+ (void)showParentView:(UIView *)parentView
//{
//    
//    circle.signProgress = 1.f;
//    [circle showInView:parentView];
//    [circle circularProgressViewStart];
//}
//+ (void)hide
//{
//    CGCircleProgressView *circle = [CGCircleProgressView defaultManager];
//    [circle removeFromSuperview];
//    circle = nil;
//    circle.progressLayer = nil;
//    circle.trackLayer = nil;
//}
@end
