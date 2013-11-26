//
//  SecondViewController.m
//  TestAutoLayout
//
//  Created by Moises Rojas on 11/26/13.
//  Copyright (c) 2013 Moises Rojas. All rights reserved.
//

#import "SecondViewController.h"
#import "UIView.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIView *headerView = [UIView autolayoutView];
    headerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:headerView];
    

    _titleLabel = [UILabel autolayoutView];
    //_titleLabel = [[UILabel alloc] init];
    _titleLabel.font = [UIFont systemFontOfSize:25.0];
    _titleLabel.numberOfLines = 1;
    _titleLabel.text = @"The Title";
    [_titleLabel setLineBreakMode:NSLineBreakByClipping];
    [headerView addSubview:_titleLabel];
    

    _leftView = [UIView autolayoutView];
    _rightView = [UIView autolayoutView];
    _button1 = [UIView autolayoutView];
    _button2 = [UIView autolayoutView];
    
    
    NSDictionary *views = NSDictionaryOfVariableBindings(headerView,_titleLabel,_leftView,_rightView, _button1, _button2);
    
    // Header view fills the width of its superview
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[headerView]|" options:0 metrics:0 views:views]];
    
     [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[headerView]" options:0 metrics:0 views:views]];
    
//    [headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-(>=113)-[_titleLabel(94)]-(>=113)-|" options:0 metrics:nil views:views]]; old code
    
     [headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[headerView]-(<=1)-[_titleLabel]" options:NSLayoutFormatAlignAllCenterX metrics:nil views:views]];
    
    [headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[headerView]-(<=1)-[_titleLabel]" options:NSLayoutFormatAlignAllCenterY metrics:nil views:views]];
    
    //[headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_titleLabel]" options:0 metrics:nil views:views]];
    
    
    /*
    // Headline and image horizontal layout
    [headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-padding-[headline]-padding-[imageView(imageEdge)]-padding-|" options:0 metrics:metrics views:views]];
    
    // Headline and byline vertical layout - spacing at least zero between the two
    [headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-padding-[headline]->=0-[byline]-padding-|" options:NSLayoutFormatAlignAllLeft metrics:metrics views:views]];
    
    // Image and button vertical layout - spacing at least 15 between the two
    [headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-padding-[imageView(imageEdge)]->=padding-[button]-padding-|" options:NSLayoutFormatAlignAllLeft | NSLayoutFormatAlignAllRight metrics:metrics views:views]];
     */

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
