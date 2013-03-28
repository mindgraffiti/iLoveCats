//
//  MainViewController.m
//  iLoveCats
//
//  Created by Thuy Copeland on 3/27/13.
//  Copyright (c) 2013 Thuy Copeland. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end
int randomNum;
@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self randomPick];
}

- (int)randomPick
{
    randomNum = arc4random_uniform(9);
    if(randomNum == 5 || randomNum ==0)
    {
        NSLog(@"0 or 5 picked, re-rolling...");
        [self randomPick];
    }
    NSLog(@"Number chosen at random: %d",randomNum);
    return randomNum;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
