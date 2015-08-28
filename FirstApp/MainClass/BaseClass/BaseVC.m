//
//  BaseVC.m
//  FirstApp
//
//  Created by Tops on 8/10/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import "BaseVC.h"

@interface BaseVC ()

@end

@implementation BaseVC

#pragma mark -
#pragma mark View Life Cycle Start Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    //[[IQKeyboardManager sharedManager] disableToolbarInViewControllerClass:[self class]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = true;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.hidden = true;
}

#pragma mark -
#pragma mark View Life Cycle End Methods
- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = true;
    [super viewWillDisappear:animated];
}
#pragma mark -
#pragma mark Slider Open/Close Methods
@end

