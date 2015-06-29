//
//  evaluate.m
//  SimpleCalculator
//
//  Created by Alec Snyder on 6/29/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

BOOL isNumber(NSString *check)
{
  if([check isEqualToString:@"0"])
  {
    return true;
  }
  
  int ret = [check intValue];
  
  if(ret == 0)
  {
    return false;
  }
  
  return true;
}

NSMutableArray *divideByAddition(NSString *expr)
{
  NSMutableArray *toReturn = [[NSMutableArray alloc] init];
  int begin = 0;
  for(int i = 0 ; i < [expr length] ; i++)
  {
    if([expr characterAtIndex:i] == '+' || [expr characterAtIndex:i] == '-')
    {
      [toReturn addObject: [expr substringWithRange:NSMakeRange(begin, i - begin)]];
      [toReturn addObject:[NSString stringWithFormat: @"%c", [expr characterAtIndex: i]]];
      begin = i+1;
    }
  }
  
  [toReturn addObject: [expr substringWithRange:NSMakeRange(begin, [expr length] - begin)]];
  return toReturn;
}

NSMutableArray *divideByMult(NSString *expr)
{
  NSMutableArray *toReturn = [[NSMutableArray alloc] init];
  int begin = 0;
  for(int i = 0 ; i < [expr length] ; i++)
  {
    if([expr characterAtIndex:i] == '*' || [expr characterAtIndex:i] == '/')
    {
      [toReturn addObject: [expr substringWithRange:NSMakeRange(begin, i - begin)]];
      [toReturn addObject:[NSString stringWithFormat: @"%c", [expr characterAtIndex: i]]];
      begin = i+1;
    }
  }
  [toReturn addObject: [expr substringWithRange:NSMakeRange(begin, [expr length] - begin)]];
  return toReturn;
}

int evaluateMultiplication(NSString *toEval)
{
  NSMutableArray *multSplit = divideByMult(toEval);
  if([multSplit count] == 1)
  {
    return [toEval intValue];
  }
  int total = 1;
  total = total * [[multSplit objectAtIndex:0] intValue];
  
  for(int i = 0; i < [multSplit count]; i++)
  {
    if([[multSplit objectAtIndex: i] isEqualToString: @"*"])
    {
      total = total * [[multSplit objectAtIndex:i+1] intValue];
    }
    else if([[multSplit objectAtIndex: i] isEqualToString: @"/"])
    {
      total = total / [[multSplit objectAtIndex:i+1] intValue];
    }
  }
  return total;
}

int evaluate(NSString *toEval)
{
  NSMutableArray *addSplit = divideByAddition(toEval);
  int total = evaluateMultiplication([addSplit objectAtIndex: 0]);
  for( int i = 0 ; i < [addSplit count] ; i++)
  {
    if([[addSplit objectAtIndex: i] isEqualToString: @""])
    {
      continue;
    }
    else if([[addSplit objectAtIndex: i] isEqualToString: @"+"])
    {
      total = total + evaluateMultiplication([addSplit objectAtIndex: i+1]);
    }
    else if([[addSplit objectAtIndex: i] isEqualToString: @"-"])
    {
      total = total - evaluateMultiplication([addSplit objectAtIndex: i+1]);
    }

  }
  return total;
}
