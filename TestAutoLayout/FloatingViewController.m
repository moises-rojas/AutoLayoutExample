//
//  FloatingViewController.m
//  TestAutoLayout
//
//  Created by Moises Rojas on 11/27/13.
//  Copyright (c) 2013 Growth Acceleration Partners. All rights reserved.
//

#import "FloatingViewController.h"
#import "UIView+autolayoutView.h"

@interface FloatingViewController ()

@end

@implementation FloatingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel *notification = [UILabel autolayoutView];
    notification.font = [UIFont systemFontOfSize:15.0];
    notification.numberOfLines = 1;
    notification.backgroundColor = [UIColor clearColor];
    notification.text = @"This is a notification";
    [notification setLineBreakMode:NSLineBreakByClipping];
    [self.view addSubview:notification];
    
    UIView *parentView = self.view;
    
    NSDictionary *views = NSDictionaryOfVariableBindings(parentView,notification);

    [parentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(==40)-[notification]" options:0 metrics:nil views:views]];
    [parentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[notification]-(15)-|" options:0 metrics:nil views:views]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
