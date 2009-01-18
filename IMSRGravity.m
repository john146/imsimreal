//
//  IMSRGravity.m
//  imSimReal
//
//  Created by John Ahrens on 12/21/08.
//  Copyright 2008 John Ahrens, LLC. All rights reserved.
//

#import "IMSRGravity.h"

@implementation IMSRGravity

@synthesize bodyGravity;
@synthesize selectedBody;

- (id)init
{
	if (![super init])
	{
		return nil;
	}
	
	bodyGravity = [[NSDictionary alloc] initWithContentsOfFile: @"Gravity.plist"];
	
	return self;
}

- (void)dealloc
{
	[bodyGravity release];
	
	[super dealloc];
}

- (double)getGravityForSelectedBody
{
	if (selectedBody == nil)
	{
		return 0.0;
	}
	
	NSNumber *gravity = [bodyGravity valueForKey: selectedBody];
	return [gravity doubleValue];
}

@end
