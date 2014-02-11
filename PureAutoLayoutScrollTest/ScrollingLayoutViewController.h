//
//  ScrollingLayoutViewController.h
//  PureAutoLayoutScrollTest
//
//  Created by Michael Hanna on 2/11/2014.
//  Copyright (c) 2014 Michael Hanna. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, VieweControllerDisplayState)
{
    ViewControllerImageScrollingState,
    ViewControllerStackedBoxesState
};

@interface ScrollingLayoutViewController : UIViewController
@property (nonatomic) VieweControllerDisplayState displayState;
@end
