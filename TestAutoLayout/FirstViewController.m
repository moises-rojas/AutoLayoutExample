//
//  FirstViewController.m
//  TestAutoLayout
//
//  Created by Moises Rojas on 11/26/13.
//  Copyright (c) 2013 Moises Rojas. All rights reserved.
//

#import "FirstViewController.h"
#import "UIView.h"
#import "FloatingViewController.h"

@interface FirstViewController ()

@property (nonatomic, strong) UIView *notification;

@end

@implementation FirstViewController

bool isOnScreen = NO;


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showFloatingViewController:(id)sender {
    
    if (!isOnScreen) {
        FloatingViewController *myController =  [self.storyboard instantiateViewControllerWithIdentifier:@"myViewController"];
        
        self.notification = myController.view;
        self.notification.translatesAutoresizingMaskIntoConstraints = NO;
        
        NSMutableDictionary *views;
        
        views = [NSMutableDictionary dictionaryWithObjectsAndKeys:self.notification, @"notification", nil];
        
        [self.view addSubview:self.notification];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[notification(==42)]|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:views]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[notification(>=320)]" options:NSLayoutFormatAlignAllCenterY metrics:nil views:views]];
        isOnScreen = YES;
    } else {
        [self.notification removeFromSuperview];
        isOnScreen = NO;
    }
}
@end
