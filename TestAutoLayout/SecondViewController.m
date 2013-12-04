//
//  SecondViewController.m
//  TestAutoLayout
//
//  Created by Moises Rojas on 11/26/13.
//  Copyright (c) 2013 Growth Acceleration Partners. All rights reserved.
//

#import "SecondViewController.h"
#import "UIView+autolayoutView.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *headerView = [UIView autolayoutView];
    headerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:headerView];

    _titleLabel = [UILabel autolayoutView];
    _titleLabel.font = [UIFont systemFontOfSize:25.0];
    _titleLabel.numberOfLines = 1;
    _titleLabel.text = @"The Title";
    [_titleLabel setLineBreakMode:NSLineBreakByClipping];
    [headerView addSubview:_titleLabel];
    
    _leftView = [UIView autolayoutView];
    _leftView.backgroundColor = [UIColor lightGrayColor];
    [headerView addSubview:_leftView];
    
    
    _rightView = [UIView autolayoutView];
    _rightView.backgroundColor = [UIColor redColor];
    [headerView addSubview:_rightView];
    
    
    _button1 = [UIButton autolayoutView];
    _button1.backgroundColor = [UIColor orangeColor];
    _button1.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [_button1 setTitle:@"Button" forState:UIControlStateNormal];
    [headerView addSubview:_button1];
    
    
    _button2 = [UIButton autolayoutView];
    _button2.backgroundColor = [UIColor grayColor];
    _button2.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [_button2 setTitle:@"Button" forState:UIControlStateNormal];
    [headerView addSubview:_button2];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(headerView,_titleLabel,_leftView,_rightView, _button1, _button2);
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[headerView]|" options:0 metrics:0 views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[headerView]" options:0 metrics:0 views:views]];
    [headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[headerView]-(<=1)-[_titleLabel]" options:NSLayoutFormatAlignAllCenterX metrics:nil views:views]];
    [headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_titleLabel]" options:0 metrics:nil views:views]];
    [headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_leftView(>=136)]-[_rightView(>=_leftView)]-|" options:0 metrics:nil views:views]];
    [headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(==58)-[_leftView(139)]" options:0 metrics:nil views:views]];
    [headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(==58)-[_rightView(139)]" options:0 metrics:nil views:views]];
    [headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_leftView]-[_button1(19)]" options:0 metrics:nil views:views]];
    [headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_rightView]-[_button2(19)]" options:0 metrics:nil views:views]];
    [headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_button1(46)]" options:0 metrics:nil views:views]];
    [headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_button2(46)]-|" options:0 metrics:nil views:views]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
