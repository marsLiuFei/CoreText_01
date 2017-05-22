//
//  ViewController.m
//  CoreText_01_简单的文字排版
//
//  Created by apple on 2017/5/22.
//  Copyright © 2017年 baixinxueche. All rights reserved.
//

#import "ViewController.h"
#import "LF_CoreTextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    LF_CoreTextView *coreTextView = [[LF_CoreTextView alloc] initWithFrame:CGRectMake(50, 50, self.view.bounds.size.width-100, self.view.bounds.size.height-100)];
    coreTextView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:coreTextView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
