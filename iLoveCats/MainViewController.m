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
int tries;
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
    tries = 0;
    self.playAgain.hidden = YES;
    return randomNum;
    
}
- (void) nag
{
    UIAlertView *msgNag = [[UIAlertView alloc]initWithTitle:@"No free beer." message:@"You suck and you should feel bad!" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    [msgNag show];
}
/* 
- (IBAction)hideBlackCats:(id)sender
{
    self.cat1.hidden = YES;
}
*/
- (void) win
{
    // show a cat
    
    // you got it! msg
    [self.winLabel setText:@"You win!"];
    
    self.playAgain.hidden = NO;
    
}
- (void) lose
{
    [self.winLabel setText:@"You lose!"];
    [self nag];
}
- (IBAction)btn1Pressed:(id)sender
{
    tries++;
    if(randomNum == 1 && tries <=4)
    {
        [self win];
    }
    else if(tries < 4)
    {
        self.oneBtn.hidden = YES;
    }
    else
    {
        [self lose];
        self.oneBtn.hidden = YES;
    }
}
- (IBAction)btn2Pressed:(id)sender
{
    tries++;
    if(randomNum == 2 && tries <=4)
    {
        [self win];
    }
    else if(tries < 4)
    {
        self.twoBtn.hidden = YES;
    }
    else
    {
        [self lose];
        self.twoBtn.hidden = YES;
    }
}
- (IBAction)btn3Pressed:(id)sender
{
    tries++;
    if(randomNum == 3 && tries <=4)
    {
        [self win];
    }
    else if(tries < 4)
    {
        self.threeBtn.hidden = YES;
    }
    else
    {
        [self lose];
        self.threeBtn.hidden = YES;
    }
}
- (IBAction)btn4Pressed:(id)sender
{
    tries++;
    if(randomNum == 4 && tries <=4)
    {
        [self win];
    }
    else if(tries < 4)
    {
        self.fourBtn.hidden = YES;
    }
    else
    {
        [self lose];
        self.fourBtn.hidden = YES;
    }
}
- (IBAction)btn5Pressed:(id)sender
{
    tries++;
    if(randomNum == 5 && tries <=4)
    {
        [self win];
    }
    else if(tries < 4)
    {
        self.fiveBtn.hidden = YES;
    }
    else
    {
        [self lose];
        self.fiveBtn.hidden = YES;
    }
}
- (IBAction)btn6Pressed:(id)sender
{
    tries++;
    if(randomNum == 6 && tries <=4)
    {
        [self win];
    }
    else if(tries < 4)
    {
        self.sixBtn.hidden = YES;
    }
    else
    {
        [self lose];
        self.sixBtn.hidden = YES;
    }
}
- (IBAction)btn7Pressed:(id)sender
{
    tries++;
    if(randomNum == 7 && tries <=4)
    {
        [self win];
    }
    else if(tries < 4)
    {
        self.sevenBtn.hidden = YES;
    }
    else
    {
        [self lose];
        self.sevenBtn.hidden = YES;
    }
}
- (IBAction)btn8Pressed:(id)sender
{
    tries++;
    if(randomNum == 8 && tries <=4)
    {
        [self win];
    }
    else if(tries < 4)
    {
        self.eightBtn.hidden = YES;
    }
    else
    {
        [self lose];
        self.eightBtn.hidden = YES;
    }
}
- (IBAction)btn9Pressed:(id)sender
{
    tries++;
    if(randomNum == 9 && tries <=4)
    {
        [self win];
    }
    else if(tries < 4)
    {
        self.nineBtn.hidden = YES;
    }
    else
    {
        [self lose];
        self.nineBtn.hidden = YES;
    }
}
- (IBAction)btnPlayAgainPressed:(id)sender
{
    [self randomPick];
    // show all the buttons again
    self.oneBtn.hidden = NO;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
