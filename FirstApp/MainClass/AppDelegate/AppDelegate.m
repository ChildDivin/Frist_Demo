//
//  AppDelegate.m
//  FirstApp
//
//  Created by Tops on 8/10/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()
{
    ViewController *baseObj;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window =[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    baseObj = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.navigationObj =[[UINavigationController alloc] initWithRootViewController:baseObj];
    self.window.rootViewController=self.navigationObj;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
}
- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
