//
//  UIView+CGCircleView.h
//  CoGo
//
//  Created by liuxy on 2018/9/6.
//  Copyright © 2018年 彭文鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "CGCircleProgressView.h"

@interface UIView (CGCircleView)

@property (nonatomic, strong) CGCircleProgressView *progressView;

- (void)showInParentView:(UIView *)parentView;

- (void)hideCircleView;
@end
