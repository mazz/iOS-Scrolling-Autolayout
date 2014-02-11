//
//  ScrollingLayoutViewController.m
//  PureAutoLayoutScrollTest
//
//  Created by Michael Hanna on 2/11/2014.
//  Copyright (c) 2014 Michael Hanna. All rights reserved.
//

#import "ScrollingLayoutViewController.h"
#import "UIView+FLKAutoLayout.h"
#import "Util.h"

@interface ScrollingLayoutViewController ()
@property (nonatomic, strong) UIView *box0;
@property (nonatomic, strong) UIView *box1;
@property (nonatomic, strong) UIView *box2;
@property (nonatomic, strong) UIView *containerView;
@property (strong, nonatomic) UIScrollView *scrollView;
@end

@implementation ScrollingLayoutViewController

- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0., 0., [[UIScreen mainScreen] applicationFrame].size.width, [[UIScreen mainScreen] applicationFrame].size.height)];
    
    CGRect boxRect = CGRectMake(0., 0., 320., 263.);
    // make off-screen views/labels
    self.box0 = [[UIView alloc] initWithFrame:boxRect];
    self.box1 = [[UIView alloc] initWithFrame:boxRect];
    self.box2 = [[UIView alloc] initWithFrame:boxRect];
    
    UILabel *label0 = [[UILabel alloc] initWithFrame:boxRect];
    UILabel *label1 = [[UILabel alloc] initWithFrame:boxRect];
    UILabel *label2 = [[UILabel alloc] initWithFrame:boxRect];
    
    NSMutableAttributedString *zero = [[NSMutableAttributedString alloc] initWithString:@"0" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Helvetica" size:300.0]}];
    NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"1" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Helvetica" size:300.0]}];
    NSMutableAttributedString *two = [[NSMutableAttributedString alloc] initWithString:@"2" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Helvetica" size:300.0]}];
    
    [label0 setAttributedText:zero];
    [label0 setTextAlignment:NSTextAlignmentCenter];
    [self.box0 addSubview:label0];
    [self.box0 setBackgroundColor:[UIColor redColor]];
    
    [label1 setAttributedText:one];
    [label1 setTextAlignment:NSTextAlignmentCenter];
    [self.box1 addSubview:label1];
    [self.box1 setBackgroundColor:[UIColor greenColor]];
    
    [label2 setAttributedText:two];
    [label2 setTextAlignment:NSTextAlignmentCenter];
    [self.box2 addSubview:label2];
    [self.box2 setBackgroundColor:[UIColor blueColor]];
    
    [view addSubview:self.box0];
    [view addSubview:self.box1];
    [view addSubview:self.box2];
    
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
    
    //    [self placeImageInScrollView];
    [self placeBoxesInScrollView];
    
    [UIView colorViewsRandomly:self.view];
    [UIView logViewRect:self.view level:0];
}

- (void)placeImageInScrollView
{
    UIImageView *imageView = [[UIImageView alloc] init];
    
    // Add an image to the image view.
    [imageView setImage:[UIImage imageNamed:@"MyReallyBigImage.jpg"]];
    
    // Add the scroll view to our view.
    //    [self.view addSubview:self.scrollView];
    
    // Add the image view to the scroll view.
    [self.scrollView addSubview:imageView];
    
    // Set the translatesAutoresizingMaskIntoConstraints to NO so that the views autoresizing mask is not translated into auto layout constraints.
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    //    UIScrollView *scrollView = self.scrollView;
    //    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(scrollView, imageView);
    //    [self.scrollView alignLeading:@"0" trailing:@"0" toView:self.containerView];
    //    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[scrollView]|" options:0 metrics:0 views:viewsDictionary]];
    
    //    [self.scrollView alignTop:@"65" bottom:@"-44" toView:self.containerView];
    //    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[scrollView]|" options:0 metrics: 0 views:viewsDictionary]];
    
    [imageView alignLeading:@"0" trailing:@"0" toView:self.scrollView];
    //    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[imageView]|" options:0 metrics: 0 views:viewsDictionary]];
    [imageView alignTop:@"0" bottom:@"0" toView:self.scrollView];
    //    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[imageView]|" options:0 metrics: 0 views:viewsDictionary]];
}

- (void)placeBoxesInScrollView
{
    UIView *scrollBox = [[UIView alloc] init];
    
    // translatesAutoresizingMaskIntoConstraints is a transitionary attribute to help developers move from traditional auto resizing masks to
    // auto layout. They are set at runtime when "Use Autolayout" is checked in a xib file.
    // They tend to interfere with programmatic auto layout
    scrollBox.translatesAutoresizingMaskIntoConstraints = NO;
    
    // for new views translatesAutoresizingMaskIntoConstraints == YES so turn this off
    self.box0.translatesAutoresizingMaskIntoConstraints = NO;
    self.box1.translatesAutoresizingMaskIntoConstraints = NO;
    self.box2.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.scrollView addSubview:scrollBox];
    
    [UIView alignTopEdgesOfViews:@[self.scrollView, scrollBox]];
    [scrollBox alignLeading:@"0" trailing:@"0" toView:self.scrollView];
    [UIView equalWidthForViews:@[self.scrollView, scrollBox]];
    
    NSArray *boxes = @[self.box0, self.box1, self.box2];
    
    [scrollBox addSubview:self.box0];
    [scrollBox addSubview:self.box1];
    [scrollBox addSubview:self.box2];
    
    [boxes[0] constrainHeight:@">=263"];
    [boxes[0] alignLeading:@"0" trailing:@"0" toView:scrollBox];
    [UIView alignTopEdgesOfViews:@[boxes[0], scrollBox]];
    [UIView equalWidthForViews:boxes];
    [UIView equalHeightForViews:boxes];
    [UIView alignLeadingAndTrailingEdgesOfViews:boxes];
    [UIView spaceOutViewsVertically:boxes predicate:@"0"];
    
    [UIView alignBottomEdgesOfViews:@[scrollBox, boxes[2]]];
    [UIView colorViewsRandomly:scrollBox];
    [UIView logViewRect:self.view level:0];
    
    [self.scrollView alignBottomEdgeWithView:scrollBox predicate:@"0"];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [UIView logViewRect:self.view level:0];
}

@end
