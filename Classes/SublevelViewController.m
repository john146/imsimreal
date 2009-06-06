//
//  SublevelViewController.m
//  imSimReal
//
//  Created by John Ahrens on 6/5/09.
//  Copyright 2009 John Ahrens, LLC. All rights reserved.
//

#import "SublevelViewController.h"
#import "imSimRealAppDelegate.h"
#import "Test.h"
#import "TestList.h"
#import "TestGravity.h"

@implementation SublevelViewController

@synthesize rowImage;
@synthesize tests;
@synthesize controllers;
@synthesize detailedAction;

- (id)initWithStyle:(UITableViewStyle)style 
{
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style]) 
	{
    }
    return self;
}

- (void)viewDidLoad
{
	if (controllers == nil)
	{
		NSMutableArray *controllerArray = [[NSMutableArray alloc] init];
		NSEnumerator *enumerator = [tests objectEnumerator];
		Test *myTest;
		while (myTest = [enumerator nextObject])
		{
			if ([myTest.delegate isMemberOfClass: [TestList class]])
			{
				TestList *test = (TestList *)myTest.delegate;
				SublevelViewController *controller = [[SublevelViewController alloc] initWithStyle: UITableViewStylePlain];
				controller.title = myTest.testName;
				controller.rowImage = self.rowImage;
				[controllerArray addObject: controller];
				
				if (test.testArray != nil)
				{
					controller.tests = test.testArray;
				}
				
				[controller release];
			}
			else if ([myTest.delegate isMemberOfClass: [TestGravity class]])
			{
//				TestGravity *test = (TestGravity *)myTest.delegate;
				SublevelViewController *controller = [[SublevelViewController alloc] initWithStyle: UITableViewStylePlain];
				controller.title = myTest.testName;
			}
		}
		
		self.controllers = controllerArray;
		[controllerArray release];
	}
	
    [super viewDidLoad];
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
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
	[rowImage release];
	[tests release];
	[controllers release];
	[detailedAction release];
	
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
    return [tests count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView 
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	NSUInteger row = [indexPath row];
    if (cell == nil) 
	{
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...
	Test *test = [tests objectAtIndex: row];
	cell.text = test.testName;
	cell.textColor = test.testColor;
	cell.font = [UIFont fontWithName: @"Helvetica"
								size: 16];

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
	NSUInteger row = [indexPath row];
	Test *test = [tests objectAtIndex: row];
	[test runTest];
	UITableViewCell *cell = [tableView cellForRowAtIndexPath: indexPath];
	cell.textColor = test.testColor;
}

- (void)tableView: (UITableView *)tableView
accesoryButtonTappedForRowWithIndexPath: (NSIndexPath *)indexPath
{
	NSUInteger row = [indexPath row];
	SublevelViewController *controller = [controllers objectAtIndex: row];
	Test *myTest = [tests objectAtIndex: row];
	if ([myTest.delegate isMemberOfClass: [TestList class]])
	{
		TestList *test = (TestList *)myTest.delegate;
		if (test.testArray != nil)
		{
			controller.tests = test.testArray;
			controller.title = myTest.testName;
			controller.detailedAction = myTest.testDetails;
		}
	}
	else if ([myTest.delegate isMemberOfClass: [TestGravity class]])
	{
//		TestGravity *test = (TestGravity *)myTest.delegate;
		controller.title = myTest.testName;
		controller.detailedAction = myTest.testDetails;
	}
	
	imSimRealAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
	[delegate.navigationController pushViewController: controller
											 animated: YES];
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
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

@end

