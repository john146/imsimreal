//
//  Test.m
//  imSimReal
//
//  Created by John Ahrens on 6/6/09.
//  Copyright 2009 John Ahrens, LLC. All rights reserved.
//

#import "Test.h"


@implementation Test

@synthesize testName;
@synthesize testColor;
@synthesize testDetails;
@synthesize delegate;

- (id)initWithTest: (NSDictionary *)test 
		  delegate: (id)theDelegate
{
	if (self = [super init])
	{
		self.testName = [test objectForKey: @"name"];
		self.testColor = [UIColor grayColor];
		self.testDetails = [test objectForKey: @"detailedAction"];
		self.delegate = theDelegate;
	}
	
	return self;
}

- (void)runTest
{
	[self.delegate executeTest: self];
}

- (void)dealloc
{
	[testName release];
	[testColor release];
	[testDetails release];
	
	[super dealloc];
}

@end
