//
//  ScrollingGraphicViewController.m
//  PureAutoLayoutScrollTest
//
//  Created by Michael Hanna on 2/11/2014.
//  Copyright (c) 2014 Michael Hanna. All rights reserved.
//

#import "ScrollingGraphicViewController.h"
#import "UIView+FLKAutoLayout.h"
#import "Util.h"

@interface ScrollingGraphicViewController ()
@property (nonatomic, strong) UIView *containerView;
@property (strong, nonatomic) UIScrollView *scrollView;
@end

@implementation ScrollingGraphicViewController

- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0., 0., [[UIScreen mainScreen] applicationFrame].size.width, [[UIScreen mainScreen] applicationFrame].size.height)];
    
    view.backgroundColor = [UIColor whiteColor];
    self.view = view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.containerView = [[UIView alloc] init];
    [self.view addSubview:self.containerView];
    
    [self.containerView alignTop:@"0" leading:@"0" bottom:@"0" trailing:@"0" toView:self.view];
    
    self.scrollView = [[UIScrollView alloc] init];
    [self.scrollView setAlwaysBounceHorizontal:NO];
    [self.scrollView setAlwaysBounceVertical:YES];
    
    [self.containerView addSubview:self.scrollView];
    
    // Set the constraints for the scroll view and the image view.
    [self.scrollView alignLeading:@"20" trailing:@"-20" toView:self.containerView];
    [self.scrollView alignTop:@"65" bottom:@"-44" toView:self.containerView];
    self.scrollView.translatesAutoresizingMaskIntoConstraints  = NO;
    
    [self placeImageInScrollView];
//    [self placeBoxesInScrollView];
    
    [UIView colorViewsRandomly:self.view];
    [UIView logViewRect:self.view level:0];
}

- (void)placeImageInScrollView
{
    UIImageView *imageView = [[UIImageView alloc] init];
    
    // Add an image to the image view.
    [imageView setImage:[UIImage imageNamed:@"MyReallyBigImage.jpg"]];
    
    // Add the image view to the scroll view.
    [self.scrollView addSubview:imageView];
    
    // Set the translatesAutoresizingMaskIntoConstraints to NO so that the views autoresizing mask is not translated into auto layout constraints.
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [imageView alignLeading:@"0" trailing:@"0" toView:self.scrollView];
    [imageView alignTop:@"0" bottom:@"0" toView:self.scrollView];
}

@end
