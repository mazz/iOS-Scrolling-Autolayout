//
//  LayoutSelectionViewController.m
//  PureAutoLayoutScrollTest
//
//  Created by Michael Hanna on 2/11/2014.
//  Copyright (c) 2014 Michael Hanna. All rights reserved.
//

#import "LayoutSelectionViewController.h"

@interface LayoutSelectionViewController ()
@property (nonatomic, strong) NSArray *tableRows;
@end

@implementation LayoutSelectionViewController

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.tableRows = @[@"Stacked Layout", @"Image Scrolling Layout", @"Stacked Scrolling Layout"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.tableRows count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = self.tableRows[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *segueName = nil;
    
    if (indexPath.row == 0) {
        segueName = @"StackedLayout";
    }
    if (indexPath.row == 1) {
        segueName = @"ScrollingGraphicLayout";
    }
    if (indexPath.row == 2) {
        segueName = @"ScrollingLayout";
    }
    
    [self performSegueWithIdentifier:segueName sender:self];
}
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([segue.identifier isEqualToString:@"StackedLayout"]) {
//        
//    }
//}

@end
