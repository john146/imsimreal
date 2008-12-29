//
//  IMSRPointObjectTestCases.m
//  imSimReal
//
//  Created by John Ahrens on 12/27/08.
//  Copyright 2008 John Ahrens, LLC. All rights reserved.
//

#import "IMSRPointObjectTestCases.h"
#import "IMSRPointObject.h"

@implementation IMSRPointObjectTestCases

- (void)testInitPointObjectWithPositionVelocityAndAcceleration
{
	IMSRPointObject *point1	= [[IMSRPointObject alloc] initWithPositionX: 0.0
															   positionY: 0.0
															   positionZ: 0.0
															   velocityX: 0.0
															   velocityY: 0.0
															   velocityZ: 0.0
														   accelerationX: 0.0
														   accelerationY: 0.0
														   accelerationZ: 0.0];
	STAssertNotNil(point1, @"Could not construct point with all zero values");
	
	NSMutableDictionary *state1	= [point1 pointObject];
	STAssertNotNil(state1, @"state dictionary not available");
	
	NSNumber *count		= [NSNumber numberWithInt: [state1 count]];
	NSNumber *expCount	= [NSNumber numberWithInt: 9];
	STAssertTrue([count isEqualToNumber: expCount], 
				 @"Incorrect number of values. Have %@, should be %@", count, expCount); 
	
	NSNumber *expValue	= [NSNumber numberWithDouble: 0.0];
	for (id key in state1)
	{
		NSNumber *value	= [state1 objectForKey: key];
		STAssertTrue([value isEqualToNumber: expValue], 
					 @"Number for %@ is %@. Should be %d", key, value, expValue);
	}

	[point1 release];
}

@end
