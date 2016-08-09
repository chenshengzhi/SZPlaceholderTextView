//
//  ViewController.m
//  SZPlaceholderTextView-Demo
//
//  Created by 陈圣治 on 16/8/9.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "ViewController.h"
#import "SZPlaceholderTextView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet SZPlaceholderTextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.textView.contentInset = UIEdgeInsetsMake(0, 50, 0, 0);
    self.textView.font = [UIFont systemFontOfSize:15];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
