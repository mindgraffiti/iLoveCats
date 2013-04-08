//
//  WinViewController.m
//  iLoveCats
//
//  Created by Thuy Copeland on 3/28/13.
//  Copyright (c) 2013 Thuy Copeland. All rights reserved.
//
#import "AppDelegate.h"
#import "WinViewController.h"

@interface WinViewController ()

@end

@implementation WinViewController

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
    self.title = @"You Win!";
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
