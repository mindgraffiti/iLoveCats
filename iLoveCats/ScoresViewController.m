//
//  ScoresViewController.m
//  iLoveCats
//
//  Created by Thuy Copeland on 4/4/13.
//  Copyright (c) 2013 Thuy Copeland. All rights reserved.
//

#import "ScoresViewController.h"

@interface ScoresViewController ()

// make the scores array
@property(strong, nonatomic) NSArray *scores;
@end

@implementation ScoresViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set the title for the table view
    self.title = @"Top Scores";
    // Make the scores persist in user defaults
    self.scores = [[NSUserDefaults standardUserDefaults] arrayForKey:@"scores"];
    // reload table data
    [self.tableView reloadData];
}

// method to populate the timed games in the table view
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.scores.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    // save your times in a variable
    id time = self.scores[indexPath.row];
    // write the time into the cells
    cell.textLabel.text = [NSString stringWithFormat:@"%@",time];
    NSLog(@"Your time is: %@", time);
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
