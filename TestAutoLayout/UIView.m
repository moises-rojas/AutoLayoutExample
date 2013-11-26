//
//  UIView.m
//  TestAutoLayout
//
//  Created by Moises Rojas on 11/26/13.
//  Copyright (c) 2013 Moises Rojas. All rights reserved.
//

#import "UIView.h"


@implementation UIView (Autolayout)

+(id)autolayoutView
{
    UIView *view = [self new];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    return view;
}

@end
