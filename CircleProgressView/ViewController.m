//
//  ViewController.m
//  CircleProgressView
//
//  Created by liuxy on 2018/9/6.
//  Copyright © 2018年 liuxy. All rights reserved.
//

#import "ViewController.h"
#import "UIView+CGCircleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view showInParentView:self.view];
    
    [self.view hideCircleView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
