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
    self.window.backgroundColor = [UIColor whiteColor];
    
    // allocate memory to the view
    self.mainView = [[MainViewController alloc]init];
    
    // make the mainviewcontroller 'home base'
    self.window.rootViewController = self.mainView;
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
