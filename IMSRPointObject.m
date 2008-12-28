//
//  IMSRPointObject.m
//  imSimReal
//
//  Created by John Ahrens on 12/27/08.
//  Copyright 2008 John Ahrens, LLC. All rights reserved.
//

#import "IMSRPointObject.h"

@implementation IMSRPointObject

@synthesize pointObject;

- (id)initWithPositionX: (double)positionX positionY: (double)positionY positionZ: (double)positionZ
			  velocityX: (double)velocityX velocityY: (double)velocityY velocityZ: (double)velocityZ
		  accelerationX: (double)accelerationX accelerationY: (double)accelerationY accelerationZ: (double)accelerationZ
{
	if (![super init])
	{
		return nil;
	}
	
	NSArray *keys = [[NSArray alloc] initWithObjects: @"positionX", @"positionY", @"positionZ",
					 @"velocityX", @"velocityY", @"velocityZ", 
					 @"accelerationX", @"accelerationY", @"accelerationZ", nil];
	NSArray *values	= [[NSArray alloc] initWithObjects: [NSNumber numberWithDouble: positionX],
					   [NSNumber numberWithDouble: positionY], [NSNumber numberWithDouble: positionZ],
					   [NSNumber numberWithDouble: velocityX], [NSNumber numberWithDouble: velocityY],
					   [NSNumber numberWithDouble: velocityZ], [NSNumber numberWithDouble: accelerationX],
					   [NSNumber numberWithDouble: accelerationY], [NSNumber numberWithDouble: accelerationZ]];
	
	pointObject	= [NSMutableDictionary dictionaryWithObjects: values forKeys: keys];
	
	return self;
}

@end
