//
//  MainViewController.m
//  iLoveCats
//
//  Created by Thuy Copeland on 3/27/13.
//  Copyright (c) 2013 Thuy Copeland. All rights reserved.
//

#import "MainViewController.h"
#import "WinViewController.h"
#import "GuessingGame.h"

@interface MainViewController ()

// declare the variable
@property (strong, nonatomic) GuessingGame *game;

@end



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
    
    // instance of GuessingGame
    self.game = [[GuessingGame alloc] init];
    
    // check to see if user has too many losses
    BOOL overage = [[NSUserDefaults standardUserDefaults]boolForKey:@"heavyLosses"];
    if(overage)
    {
        // remove all the buttons from the screen
        [self hideButtons];
        [self hideWins];
        
        // send game message
        [self.winLabel setText:@"Game over."];
        
        // reset game message
        [self nag];
    }
    [self.game answer];
    [self refreshUI];
    // hide win markers (black cats)
    [self hideWins];
    
}

- (int)refreshUI
{
    self.playAgain.hidden = YES;
    [self.guessButtons setValue:[NSNumber numberWithBool:YES] forKey:@"enabled"];
    return self.game.randomNum;
    
}
- (void) nag
{
    UIAlertView *msgNag = [[UIAlertView alloc]initWithTitle:@"No free beer." message:@"You suck and you should feel bad!" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    [msgNag show];
}

- (void) win
{
    // count up wins
    self.game.totalWins++;
    
    // This needs more refactoring.
    if(self.game.totalWins == 1)
    {
        // show a cat
        self.cat1.hidden = NO;
    }
    else if(self.game.totalWins == 2)
    {
        self.cat2.hidden = NO;
    }
    else if(self.game.totalWins == 3){
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
- (void) lose
{
    self.game.totalLosses++;
    if(self.game.totalLosses == self.game.maxPlays)
    {
        // remove all the buttons from the screen
        [self hideButtons];
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
        [self hideButtons];
        self.playAgain.hidden = NO;
    }
}
- (void) hideButtons
{
    [self.guessButtons setValue: [NSNumber numberWithBool:YES] forKey:@"hidden"];
}
- (void) showButtons
{
    [self.guessButtons setValue:[NSNumber numberWithBool:NO] forKey:@"hidden"];
}

- (void) hideWins
{
    [self.catTally setValue:[NSNumber numberWithBool:YES] forKey:@"hidden"];
}
- (IBAction)ButtonSelected:(id)sender
{
    UIButton *ButtonPushed = (UIButton *)sender;
    NSLog(@"Button pressed: %@",[sender currentTitle]);
    self.game.tries++;
    int choice = [[sender currentTitle] integerValue];
    if([self.game playerChoice:choice])
    {
        [self win];
    }
    else if(self.game.tries < self.game.maxTries)
    {
        [ButtonPushed setHidden: YES];
    }
    else
    {
        [self lose];
        [ButtonPushed setHidden: YES];
    }
}
- (IBAction)ButtonPlayAgainPressed:(id)sender
{
    [self.game answer];
    [self refreshUI];
    
    // show all the buttons again
    [self showButtons];
    
    // reset game message
    [self.winLabel setText: @"Guess a number."];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
