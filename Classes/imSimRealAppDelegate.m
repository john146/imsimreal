//
//  imSimRealAppDelegate.m
//  imSimReal
//
//  Created by John Ahrens on 6/4/09.
//  Copyright John Ahrens, LLC 2009. All rights reserved.
//

#import "imSimRealAppDelegate.h"
#import "RootViewController.h"


@implementation imSimRealAppDelegate

@synthesize window;
@synthesize navigationController;


- (void)applicationDidFinishLaunching:(UIApplication *)application 
{
	// Configure and show the window
	[window addSubview:[navigationController view]];
	[window makeKeyAndVisible];
}

/*
(void)applicationWillTerminate:(UIApplication *)application 
{
	// Save data if appropriate
}
*/

- (void)dealloc 
{
	[navigationController release];
	[window release];

	[super dealloc];
}

@end
