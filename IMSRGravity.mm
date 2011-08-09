//
//  IMSRGravity.m
//  imSimReal
//
//  Created by John Ahrens on 12/21/08.
//  Copyright 2008, 2011 John Ahrens, LLC. All rights reserved.
//

#import "IMSRGravity.h"

#include "../imsimreal/imsimreal/imsimreal/imsimreal.h"

struct IMSRGravityImpl: imsimreal::Gravity {};

@implementation IMSRGravity

@synthesize bodyGravity;

- (id)init
{
	if (![super init])
	{
		return nil;
	}
	
	bodyGravity = [[NSDictionary alloc] initWithContentsOfFile: @"Gravity.plist"];
    gravity = new IMSRGravityImpl;
	
	return self;
}

- (double)gravity
{
    return gravity->getGravity();
}

- (void)dealloc
{
	self.bodyGravity = nil;
    delete gravity;
    gravity = nil;
	
	[super dealloc];
}

@end
