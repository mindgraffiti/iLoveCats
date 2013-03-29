//
//  MainViewController.m
//  iLoveCats
//
//  Created by Thuy Copeland on 3/27/13.
//  Copyright (c) 2013 Thuy Copeland. All rights reserved.
//

#import "MainViewController.h"
#import "WinViewController.h"

@interface MainViewController ()

@end
int randomNum;
int tries;
int totalWins;
int totalLosses;
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
    
    // check to see if user has too many losses
    BOOL overage = [[NSUserDefaults standardUserDefaults]boolForKey:@"heavyLosses"];
    if(overage)
    {
        // remove all the buttons from the screen
        [self hideBtns];
        [self hideWins];
        
        // send game message
        [self.winLabel setText:@"Game over."];
        
        // reset game message
        [self nag];
    }
    
    [self randomPick];
    // hide win markers (black cats)
    [self hideWins];
    
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
    [self.guessButtons setValue:[NSNumber numberWithBool:YES] forKey:@"enabled"];
    return randomNum;
    
}
- (void) nag
{
    UIAlertView *msgNag = [[UIAlertView alloc]initWithTitle:@"No free beer." message:@"You suck and you should feel bad!" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    [msgNag show];
}

- (void) win
{
    if(totalWins == 3)
    {
        // show new view with happy cat
        
    }
    else
    {
        // count up wins
        totalWins++;
        if(totalWins == 1)
        {
            // show a cat
            self.cat1.hidden = NO;
        }
        else if(totalWins == 2)
        {
            self.cat2.hidden = NO;
        }
        else if(totalWins == 3){
            [self.catTally setValue:[NSNumber numberWithBool:NO] forKey:@"hidden"];
            // point to where winView is located
            WinViewController *view;
            // alloc memory to winView
            view = [[WinViewController alloc ]init];
            // move them to the winView
            [self presentViewController:view animated:YES completion:Nil];
        }
        // disable buttons for further guessing
        [self.guessButtons setValue:[NSNumber numberWithBool:NO] forKey:@"enabled"];
        // you got it! msg
        [self.winLabel setText:@"You win! Have a cat."];
        // show play again button
        self.playAgain.hidden = NO;
    }
}
- (void) lose
{
    totalLosses++;
    if(totalLosses == 4)
    {
        // remove all the buttons from the screen
        [self hideBtns];
        // send game message
        [self.winLabel setText:@"Game over."];
        // reset game message
        [self nag];
        [[NSUserDefaults standardUserDefaults] setBool:TRUE forKey:@"heavyLosses"];
    }
    else
    {
        [self.winLabel setText:@"You lose!"];
        // remove all the buttons from the screen
        [self hideBtns];
        self.playAgain.hidden = NO;
    }
}
- (void) hideBtns
{
    [self.guessButtons setValue: [NSNumber numberWithBool:YES] forKey:@"hidden"];
}
- (void) showBtns
{
    [self.guessButtons setValue:[NSNumber numberWithBool:NO] forKey:@"hidden"];
}

- (void) hideWins
{
    [self.catTally setValue:[NSNumber numberWithBool:YES] forKey:@"hidden"];
}
- (IBAction)btnSelected:(id)sender
{
    UIButton *btnPushed = (UIButton *)sender;
    NSLog(@"Button pressed: %@",[sender currentTitle]);
    tries++;
    
    if(randomNum == [[sender currentTitle] integerValue]&& tries <= 4)
    {
        [self win];
    }
    else if(tries < 4)
    {
        [btnPushed setHidden: YES];
    }
    else
    {
        [self lose];
        [btnPushed setHidden: YES];
    }
}
- (IBAction)btnPlayAgainPressed:(id)sender
{
    [self randomPick];
    
    // show all the buttons again
    [self showBtns];
    
    // reset game message
    [self.winLabel setText: @"Guess a number."];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
