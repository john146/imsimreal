//
//  RootViewController.m
//  imSimReal
//
//  Created by John Ahrens on 6/4/09.
//  Copyright John Ahrens, LLC 2009. All rights reserved.
//

#import "RootViewController.h"
#import "imSimRealAppDelegate.h"

@implementation RootViewController

@synthesize rowImage;
@synthesize tests;
@synthesize controllers;

- (id)initWithStyle: (UITableViewStyle)style 
{
	if (self = [super initWithStyle: style])
	{
		// local initialization here
	}
	
	return self;
}

- (void)viewDidLoad 
{
	self.title	= @"imSimReal";
	self.rowImage = [UIImage imageNamed: @"disclosureButtonControllerIcon.png"];
	NSMutableArray *testArray = [[NSMutableArray alloc] init];
	NSMutableArray *controlArray = [[NSMutableArray alloc] init];
	NSArray *path = [[NSBundle mainBundle] pathForResource: @"RootTests"
														  ofType:@"plist"];
	NSArray *plistTests = [NSArray arrayWithContentsOfFile: path];
	NSEnumerator *enumerator = [plistTests objectEnumerator];
	NSDictionary *testDictionary;
	while (testDictionary = [enumerator nextObject])
	{
//		TestList *listTest = [[TestList alloc] initWithTest: testDictionary];
	}
	
    [super viewDidLoad];
}

/*
- (void)viewWillAppear:(BOOL)animated 
{
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated 
{
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated 
{
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning 
{
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

- (void)dealloc 
{
    [super dealloc];
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section 
{
    return 1;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView 
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
	{
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero 
									   reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...
	cell.text	= @"Gravity";

    return cell;
}

- (UITableViewCellAccessoryType)tableView: (UITableView *)tableView
		 accessoryTypeForRowWithIndexPath: (NSIndexPath *)indexPath
{
	return UITableViewCellAccessoryDetailDisclosureButton;
}

- (void)tableView:(UITableView *)tableView 
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView 
 commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
 forRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView 
 moveRowAtIndexPath:(NSIndexPath *)fromIndexPath 
 toIndexPath:(NSIndexPath *)toIndexPath 
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView 
 canMoveRowAtIndexPath:(NSIndexPath *)indexPath 
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

@end

