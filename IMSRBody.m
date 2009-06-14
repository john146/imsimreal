//
//  IMSRBody.m
//  imSimReal
//
//  Created by John Ahrens on 6/13/09.
//  Copyright 2009 John Ahrens, LLC. All rights reserved.
//

#import "IMSRBody.h"

@implementation IMSRBody

@synthesize bodyName;
@synthesize bodyGravity;

- (id)init
{
	return nil;
}

- (id)initWithName: (NSString *)name gravity: (double)gravity
{
	if (name == nil)
		return nil;
	
	if (self = [super init])
	{
		self.bodyName = name;
		self.bodyGravity = gravity;
	}
	
	return self;
}

- (void)dealloc
{
	[bodyName release];
	
	[super dealloc];
}

@end
