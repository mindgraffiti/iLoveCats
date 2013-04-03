//
//  GuessingGame.h
//  iLoveCats
//
//  Created by Thuy Copeland on 4/2/13.
//  Copyright (c) 2013 Thuy Copeland. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GuessingGame : NSObject

@property (assign, nonatomic) int randomNum;
@property (assign, nonatomic) int tries;
@property (assign, nonatomic) int totalWins;
@property (assign, nonatomic) int totalLosses;


@end
