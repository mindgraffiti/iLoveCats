//
//  AppDelegate.m
//  iLoveCats
//
//  Created by Thuy Copeland on 3/27/13.
//  Copyright (c) 2013 Thuy Copeland. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    // change your rootview to the MainViewController
    UIViewController *rootView = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    self.navController = [[UINavigationController alloc] initWithRootViewController:rootView];
    [[self window] setRootViewController:self.navController];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
