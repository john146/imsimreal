//
//  TestGravity.m
//  imSimReal
//
//  Created by John Ahrens on 6/6/09.
//  Copyright 2009 John Ahrens, LLC. All rights reserved.
//

#import "TestGravity.h"

@implementation TestGravity

@synthesize testMethod;
@synthesize selectedBody;
@synthesize gravity;

- (id)initWithTest: (NSDictionary *)test
{
	testMethod = [test objectForKey: @"method"];
	selectedBody = [test objectForKey: @"returnSelectedBody"];
	gravity = [[test objectForKey: @"returnGravity"] doubleValue];
	
	return self;
}

- (void)dealloc
{
	[testMethod release];
	[selectedBody release];
	
	[super dealloc];
}

#pragma mark Test Delegate Method

- (void)executeTest: (Test *)test
{
	
}

@end
