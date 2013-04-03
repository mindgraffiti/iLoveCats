//
//  GuessingGame.m
//  iLoveCats
//
//  Created by Thuy Copeland on 4/2/13.
//  Copyright (c) 2013 Thuy Copeland. All rights reserved.
//

#import "GuessingGame.h"

@implementation GuessingGame

- (id) init
{
    self = [super init];
    if(self)
    {
        self.maxTries = 4;
        self.maxPlays = 4;
    }
    return self;
}

- (int)answer
{
    self.randomNum = arc4random_uniform(9);
    if(self.randomNum == 5 || self.randomNum ==0)
    {
        NSLog(@"0 or 5 picked, re-rolling...");
        [self answer];
    }
    NSLog(@"Number chosen at random: %d",self.randomNum);
    self.tries = 0;
    return self.randomNum;
    
}

@end
