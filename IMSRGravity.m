//
//  IMSRGravity.m
//  imSimReal
//
//  Created by John Ahrens on 12/21/08.
//  Copyright 2008 John Ahrens, LLC. All rights reserved.
//

#import "IMSRGravity.h"
#import "IMSRBody.h"

@implementation IMSRGravity

@synthesize bodyGravity;
@synthesize selectedBodyName;
@synthesize selectedBody;

- (id)init
{
	return [self initWithBody: @"Earth"]; // Use Earth in the absence of other values
}

- (id)initWithBody: (NSString *)body
{
	if (![super init])
	{
		return nil;
	}

	NSBundle *bundle	= [NSBundle mainBundle];
	NSString *file		= [bundle pathForResource: @"Gravity" ofType: @"plist"];
	bodyGravity = [[NSDictionary alloc] initWithContentsOfFile: file];
	NSNumber *gravity = [bodyGravity objectForKey: body];
	if (gravity == nil)
	{
		// Invalid body value
		return nil;
	}
	
	selectedBodyName	= body;
	selectedBody = [[IMSRBody alloc] initWithName: body gravity: [gravity doubleValue]];
	
	NSLog(@"Gravity of %@: %f", selectedBody.bodyName, selectedBody.bodyGravity);
	
	return self;
}

- (double)gravityForSelectedBody
{
	if (selectedBody == nil)
	{
		return 0.0;
	}

	return selectedBody.bodyGravity;
}

- (void)dealloc
{
	[bodyGravity release];
	[selectedBody release];
	
	[super dealloc];
}

@end
