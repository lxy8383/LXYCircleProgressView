//
//  UIView+CGCircleView.m
//  CoGo
//
//  Created by liuxy on 2018/9/6.
//  Copyright © 2018年 彭文鑫. All rights reserved.
//

#import "UIView+CGCircleView.h"

@implementation UIView (CGCircleView)

- (void)showInParentView:(UIView *)parentView
{
    [self.progressView showInView:parentView];
    [self.progressView circularProgressViewStart];
}
- (void)hideCircleView
{
    [self.progressView removeFromSuperview];
}
#pragma mark -
- (CGCircleProgressView *)progressView
{
    CGCircleProgressView *_progressView = objc_getAssociatedObject(self, @selector(progressView));
    if(!_progressView){
        _progressView = [[CGCircleProgressView alloc]init];
        _progressView.signProgress = 1.f;
        objc_setAssociatedObject(self, @selector(progressView), _progressView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return _progressView;
}
- (void)setProgressView:(CGCircleProgressView *)progressView
{
     objc_setAssociatedObject(self, @selector(progressView), progressView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
