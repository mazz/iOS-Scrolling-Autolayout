//
//  AppendLayoutViewController.m
//  PureAutoLayoutScrollTest
//
//  Created by Michael Hanna on 2/9/2014.
//  Copyright (c) 2014 Michael Hanna. All rights reserved.
//

#import "AppendLayoutViewController.h"
#import "UIView+FLKAutoLayout.h"
#import "Util.h"

@interface AppendLayoutViewController ()
@property (weak, nonatomic) IBOutlet UIView *box0;
@property (weak, nonatomic) IBOutlet UIView *box1;
@property (weak, nonatomic) IBOutlet UIView *box2;
@property (strong, nonatomic) UIView *containerView;
@end

@implementation AppendLayoutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.containerView = [[UIView alloc] init];
    [self.view addSubview:self.containerView];
    
    [self.containerView alignTop:@"0" leading:@"0" bottom:@"0" trailing:@"0" toView:self.view];
    
    UIView *viewBox = [[UIView alloc] init];
    viewBox.translatesAutoresizingMaskIntoConstraints = NO;

    [self.containerView addSubview:viewBox];
    [viewBox alignTop:@"10" leading:@"20" bottom:@"-30" trailing:@"-20" toView:self.containerView];

//    [viewBox alignLeading:@"0" trailing:@"0" toView:self.containerView];
//    [viewBox alignTop:@"65" bottom:@"-44" toView:self.containerView];

    self.box0.translatesAutoresizingMaskIntoConstraints = NO;
    self.box1.translatesAutoresizingMaskIntoConstraints = NO;
    self.box2.translatesAutoresizingMaskIntoConstraints = NO;

    [viewBox addSubview:self.box0];
    [viewBox addSubview:self.box1];
    [viewBox addSubview:self.box2];
    
    NSArray *boxes = @[self.box0, self.box1, self.box2];
    
    //[boxes[0] constrainWidth:@">=320" height:@">=263"];
    [boxes[0] constrainHeight:@">=263"];
    [boxes[0] alignLeading:@"0" trailing:@"0" toView:viewBox];
//    [boxes[0] constrainWidthToView:self.containerView predicate:@"0"]; NG
    [UIView alignTopEdgesOfViews:@[boxes[0], viewBox]];
//    [UIView alignBottomEdgesOfViews:@[boxes[2], viewBox]]; NG
    [UIView equalWidthForViews:boxes];
    [UIView equalHeightForViews:boxes];
//    [boxes[0] alignCenterXWithView:viewBox predicate:nil];
    [UIView alignLeadingAndTrailingEdgesOfViews:boxes];
//    [UIView alignTopAndBottomEdgesOfViews:boxes]; NG
    [UIView spaceOutViewsVertically:boxes predicate:@"0"];
//    [UIView distributeCenterYOfViews:boxes inView:viewBox]; NG

    [UIView colorViewsRandomly:self.view];
    [UIView logViewRect:self.view level:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end