//
//  ViewController.m
//  SimpleCalculator
//
//  Created by Allen Wu on 6/29/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel* lcdDisplay;
@property (nonatomic, strong) UIButton* button1;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  [self setupView];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


#pragma mark - Layout

- (void)setupView
{
  self.view.backgroundColor = [UIColor darkGrayColor];
  
  self.lcdDisplay = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 200, 50)];
  self.lcdDisplay.backgroundColor = [UIColor blackColor];
  self.lcdDisplay.textColor = [UIColor greenColor];
  self.lcdDisplay.text = @"0";
  
  
  self.button1 = [[UIButton alloc] initWithFrame:CGRectMake(20, 80, 50, 50)];
  [self.button1 setTitle:@"1" forState:UIControlStateNormal];
  self.button1.backgroundColor = [UIColor whiteColor];
  [self.button1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
  [self.button1 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
  
  [self.view addSubview:self.lcdDisplay];
  [self.view addSubview:self.button1];
}


#pragma mark - Actions

- (void)buttonPressed:(id)sender
{
  self.lcdDisplay.text = [self.lcdDisplay.text stringByAppendingString:@"1"];
}

@end
