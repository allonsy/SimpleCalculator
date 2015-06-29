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
@property (nonatomic, strong) NSMutableArray* buttonList;

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
  self.buttonList = [NSMutableArray arrayWithObjects:
                      [[UIButton alloc] initWithFrame:CGRectMake(20, 80, 50, 50)] //1
                     ,[[UIButton alloc] initWithFrame:CGRectMake(80, 80, 50, 50)] //2
                     ,[[UIButton alloc] initWithFrame:CGRectMake(140, 80, 50, 50)] //3
                     ,[[UIButton alloc] initWithFrame:CGRectMake(200, 80, 50, 50)] //4
                     ,[[UIButton alloc] initWithFrame:CGRectMake(260, 80, 50, 50)] //5
                     ,[[UIButton alloc] initWithFrame:CGRectMake(20, 140, 50, 50)] //6
                     ,[[UIButton alloc] initWithFrame:CGRectMake(80, 140, 50, 50)] //7
                     ,[[UIButton alloc] initWithFrame:CGRectMake(140, 140, 50, 50)] //8
                     ,[[UIButton alloc] initWithFrame:CGRectMake(200, 140, 50, 50)] //9
                     ,[[UIButton alloc] initWithFrame:CGRectMake(260, 140, 50, 50)] //0
                     ,[[UIButton alloc] initWithFrame:CGRectMake(20, 200, 50, 50)] //+
                     ,[[UIButton alloc] initWithFrame:CGRectMake(80, 200, 50, 50)] //-
                     ,[[UIButton alloc] initWithFrame:CGRectMake(140, 200, 50, 50)] //*
                     ,[[UIButton alloc] initWithFrame:CGRectMake(200, 200, 50, 50)] //divide
                     ,[[UIButton alloc] initWithFrame:CGRectMake(260, 200, 50, 50)] //delete
                     ,[[UIButton alloc] initWithFrame:CGRectMake(20, 260, 100, 50)] //enter
                     ,[[UIButton alloc] initWithFrame:CGRectMake(130, 260, 100, 50)] //clear
                     , nil];
  
  NSArray *buttonNames = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0",@"+",@"-",@"*",@"/",@"del",@"enter",@"clear"];
  
  self.view.backgroundColor = [UIColor brownColor];
  
  self.lcdDisplay = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 200, 50)];
  self.lcdDisplay.backgroundColor = [UIColor blackColor];
  self.lcdDisplay.textColor = [UIColor greenColor];
  self.lcdDisplay.text = @"";
  
  for(int i = 0 ; i < [self.buttonList count] ; i++)
  {
    UIButton *thisButton = [self.buttonList objectAtIndex:i];
    [thisButton setTitle:[buttonNames objectAtIndex:i] forState:UIControlStateNormal];
    thisButton.backgroundColor = [UIColor whiteColor];
    [thisButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [thisButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
  }
  
  [self.view addSubview:self.lcdDisplay];
  
  for(int i = 0; i < [self.buttonList count] ; i++)
  {
    [self.view addSubview:[self.buttonList objectAtIndex:i]];
  }
}


#pragma mark - Actions

- (void)buttonPressed:(id)sender
{
  UIButton *pressedButton = (UIButton *) sender;
  NSString *buttonText = [[pressedButton titleLabel] text];
  if([buttonText isEqualToString:@"clear"])
  {
    self.lcdDisplay.text = @"";
  }
  else if([buttonText isEqualToString:@"del"])
  {
    if([self.lcdDisplay.text length] > 0)
    {
       self.lcdDisplay.text = [self.lcdDisplay.text substringToIndex:[self.lcdDisplay.text length]-1];
    }
  }
  else
  {
    self.lcdDisplay.text = [self.lcdDisplay.text stringByAppendingString:buttonText];
  }
}

@end
