//
//  UIView+autolayoutView.m
//  TestAutoLayout
//
//  Created by Moises Rojas on 12/4/13.
//  Copyright (c) 2013 Growth Acceleration Partners. All rights reserved.
//

#import "UIView+autolayoutView.h"

@implementation UIView (autolayoutView)

+(id)autolayoutView
{
    UIView *view = [self new];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    return view;
}
@end
