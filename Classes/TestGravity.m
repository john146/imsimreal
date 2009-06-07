//
//  TestGravity.m
//  imSimReal
//
//  Created by John Ahrens on 6/6/09.
//  Copyright 2009 John Ahrens, LLC. All rights reserved.
//

#import "TestGravity.h"
#import "IMSRGravity.h"

@implementation TestGravity

@synthesize testMethod;
@synthesize selectedBody;
@synthesize body;
@synthesize gravity;
@synthesize nilReturn;

- (id)initWithTest: (NSDictionary *)test
{
	self.testMethod = [test objectForKey: @"method"];
	self.selectedBody = [test objectForKey: @"returnSelectedBody"];
	self.body = [test objectForKey: @"body"];
	self.gravity = [[test objectForKey: @"returnGravity"] doubleValue];
	self.nilReturn = [[test objectForKey: @"nilReturn"] boolValue];
	
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
	if ([self.testMethod isEqualToString: @"init"])
	{
		IMSRGravity *myGravity = [[IMSRGravity alloc] init];
		if (myGravity != nil && 
			[myGravity.selectedBody isEqualToString: self.selectedBody] &&
			[myGravity gravityForSelectedBody] == self.gravity)
		{
			test.testColor = [UIColor greenColor];
		}
		else
		{
			test.testColor = [UIColor redColor];
		}
	}
	else if ([self.testMethod isEqualToString: @"initWithBody"])
	{
		IMSRGravity *myGravity = [[IMSRGravity alloc] initWithBody: self.body];
		if ((myGravity == nil && self.nilReturn) ||
			(myGravity != nil && !self.nilReturn &&
			 [myGravity.selectedBody isEqualToString: self.selectedBody] &&
			 [myGravity gravityForSelectedBody] == self.gravity))
		{
			test.testColor = [UIColor greenColor];
		}
		else 
		{
			test.testColor = [UIColor redColor];
		}
	}
}

@end
