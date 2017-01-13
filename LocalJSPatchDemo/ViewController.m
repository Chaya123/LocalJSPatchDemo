//
//  ViewController.m
//  LocalJSPatchDemo
//
//  Created by liu on 2017/1/3.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"ViewController";
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 50)];
    [btn setTitle:@"Push LCJTableViewController" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(handleBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:btn];
}

- (void)handleBtn:(id)sender
{
    NSLog(@"btnClick");
}


@end
