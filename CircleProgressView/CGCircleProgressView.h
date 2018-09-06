//
//  CGCircleProgressView.h
//  CoGo
//
//  Created by liuxy on 2018/9/6.
//  Copyright © 2018年 彭文鑫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CGCircleProgressView : UIView

/** 进度 */
@property(nonatomic,assign)CGFloat signProgress;

- (void)circularProgressViewStart;

- (void)showInView:(UIView *)parentView;

@end
