//
//  StackedLayoutViewController.m
//  PureAutoLayoutScrollTest
//
//  Created by Michael Hanna on 2/11/2014.
//  Copyright (c) 2014 Michael Hanna. All rights reserved.
//

#import "StackedLayoutViewController.h"
#import "UIView+FLKAutoLayout.h"
#import "Util.h"

@interface StackedLayoutViewController ()
@property (nonatomic, strong) UIView *box0;
@property (nonatomic, strong) UIView *box1;
@property (nonatomic, strong) UIView *box2;
@property (nonatomic, strong) UIView *containerView;
@end

@implementation StackedLayoutViewController

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
	// Do any additional setup after loading the view.
    self.containerView = [[UIView alloc] init];
    [self.view addSubview:self.containerView];
    
    [self.containerView alignTop:@"0" leading:@"0" bottom:@"0" trailing:@"0" toView:self.view];
    
    UIView *viewBox = [[UIView alloc] init];
    
    // translatesAutoresizingMaskIntoConstraints is a transitionary attribute to help developers move from traditional auto resizing masks to
    // auto layout. They are set at runtime when "Use Autolayout" is checked in a xib file.
    // They tend to interfere with programmatic auto layout
    
    // for new views translatesAutoresizingMaskIntoConstraints == YES so turn this off
    viewBox.translatesAutoresizingMaskIntoConstraints = NO;
    
    // just in case, turn these off too
    self.box0.translatesAutoresizingMaskIntoConstraints = NO;
    self.box1.translatesAutoresizingMaskIntoConstraints = NO;
    self.box2.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.containerView addSubview:viewBox];
    
    [viewBox alignTop:@"0" leading:@"0" toView:self.containerView];
    [viewBox alignTrailingEdgeWithView:self.containerView predicate:@"0"];

    NSArray *boxes = @[self.box0, self.box1, self.box2];
    
    [viewBox addSubview:self.box0];
    [viewBox addSubview:self.box1];
    [viewBox addSubview:self.box2];
    
    [boxes[0] constrainWidth:@">=320" height:@">=263"];
    [boxes[0] alignLeading:@"0" trailing:@"0" toView:viewBox];
    [UIView alignTopEdgesOfViews:@[boxes[0], viewBox]];
    [UIView equalWidthForViews:boxes];
    [UIView equalHeightForViews:boxes];
    [UIView alignLeadingAndTrailingEdgesOfViews:boxes];
    [UIView spaceOutViewsVertically:boxes predicate:@"0"];
    
    [UIView alignBottomEdgesOfViews:@[viewBox, boxes[2]]];
    [UIView colorViewsRandomly:viewBox];
    [UIView logViewRect:self.view level:0];

    [UIView colorViewsRandomly:self.view];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [UIView logViewRect:self.view level:0];
}

@end
