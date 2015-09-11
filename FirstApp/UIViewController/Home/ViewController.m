//
//  ViewController.m
//  FirstApp
//
//  Created by Tops on 8/10/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [AlertView showAlert:@"Copyright (c) 2015 Tops. All rights reservedCopyright (c) 2015 Tops. All rights reserved " alertType:AJNotificationTypeGreen];
    
//    [LoadingView showLoaderWithOverlay:YES text:@"sdfgs dfgsd"];
    [LoadingView showLoaderWithOverlay:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
