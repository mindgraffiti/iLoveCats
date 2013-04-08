//
//  ScoresViewController.h
//  iLoveCats
//
//  Created by Thuy Copeland on 4/4/13.
//  Copyright (c) 2013 Thuy Copeland. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoresViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic) IBOutlet UITableView *tableView;

@end
