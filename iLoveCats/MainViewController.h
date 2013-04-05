//
//  MainViewController.h
//  iLoveCats
//
//  Created by Thuy Copeland on 3/27/13.
//  Copyright (c) 2013 Thuy Copeland. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *playAgain;
@property (strong, nonatomic) IBOutlet UIButton *topScores;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *guessButtons;

@property (strong, nonatomic) IBOutlet UILabel *winLabel;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *catTally;
@property (strong, nonatomic) IBOutlet UIImageView *cat1;
@property (strong, nonatomic) IBOutlet UIImageView *cat2;
@property (strong, nonatomic) IBOutlet UIImageView *cat3;

@property (nonatomic) NSTimeInterval duration;

@end
