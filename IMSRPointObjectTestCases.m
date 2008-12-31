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
	NSArray	*keys			= [[NSArray alloc] initWithObjects: @"positionX",
							   @"positionY", @"positionZ", @"velocityX",
							   @"velocityY", @"velocityZ", @"accelerationX",
							   @"accelerationY", @"accelerationZ", nil];
	NSNumber *expValue		= [NSNumber numberWithDouble: 0.0];

	IMSRPointObject *point1	= [[IMSRPointObject alloc] initWithPositionX: [expValue doubleValue]
															   positionY: [expValue doubleValue]
															   positionZ: [expValue doubleValue]
															   velocityX: [expValue doubleValue]
															   velocityY: [expValue doubleValue]
															   velocityZ: [expValue doubleValue]
														   accelerationX: [expValue doubleValue]
														   accelerationY: [expValue doubleValue]
														   accelerationZ: [expValue doubleValue]];
	STAssertNotNil(point1, @"Could not construct point with all zero values");
	
	NSMutableDictionary *state1	= [point1 pointObject];
	STAssertNotNil(state1, @"state dictionary not available");
	
	NSNumber *count		= [NSNumber numberWithInt: [state1 count]];
	NSNumber *expCount	= [NSNumber numberWithInt: 9];
	STAssertTrue([count isEqualToNumber: expCount], 
				 @"Incorrect number of values. Have %@, should be %@", count, expCount); 
	
	for (id key in state1)
	{
		NSNumber *value	= [state1 objectForKey: key];
		STAssertTrue([value isEqualToNumber: expValue], 
					 @"Number for %@ is %@. Should be %d", key, value, expValue);
	}
	
	NSArray	*values	= [[NSArray alloc] initWithObjects: expValue, expValue, expValue,
					   expValue, expValue, expValue, [NSNumber numberWithDouble: 1.0],
					   [NSNumber numberWithDouble: 2.0], [NSNumber numberWithDouble: -3.1], nil];
	
	NSDictionary	*expValues	= [NSDictionary dictionaryWithObjects: values forKeys: keys];
	
	IMSRPointObject	*point2	= [[IMSRPointObject alloc] initWithPositionX: [[expValues objectForKey:@"positionX"] doubleValue]
															   positionY: [[expValues objectForKey:@"positionY"] doubleValue]
															   positionZ: [[expValues objectForKey:@"positionZ"] doubleValue]
															   velocityX: [[expValues objectForKey:@"velocityX"] doubleValue]
															   velocityY: [[expValues objectForKey:@"velocityY"] doubleValue]
															   velocityZ: [[expValues objectForKey:@"velocityZ"] doubleValue]
														   accelerationX: [[expValues objectForKey:@"accelerationX"] doubleValue]
														   accelerationY: [[expValues objectForKey:@"accelerationY"] doubleValue]
														   accelerationZ: [[expValues objectForKey:@"accelerationZ"] doubleValue]];
	STAssertNotNil(point2, @"Could not construct point with acceleration values only");
	
	NSMutableDictionary	*state2	= [point2 pointObject];
	STAssertNotNil(state2, @"State dictionary not available for point2");
	
	count	= [NSNumber numberWithInt: [state2 count]];
	STAssertTrue([count isEqualToNumber: expCount],
				 @"Incorrect number of values. Have %@, should be %@", count, expCount);
	
	for (id key in state2)
	{
		NSNumber *value		= [state2 objectForKey: key];
		expValue			= [expValues objectForKey: key];
		STAssertTrue([value isEqualToNumber: expValue], 
					 @"Number for %@ is %@. Should be %@", key, value, expValue);
	}
	
	[keys release];
	[values release];
	[point1 release];
	[point2 release];
}

- (void)testInitPointObjectWithPositionAndVelocity
{
	NSArray	*keys			= [[NSArray alloc] initWithObjects: @"positionX",
							   @"positionY", @"positionZ", @"velocityX",
							   @"velocityY", @"velocityZ", nil];
	
	NSArray		*values	= [[NSArray alloc] initWithObjects: [NSNumber numberWithDouble: 1.0],
						   [NSNumber numberWithDouble: -1.5], [NSNumber numberWithDouble: 0.7],
						   [NSNumber numberWithDouble: 3.0], [NSNumber numberWithDouble: -3.5],
						   [NSNumber numberWithDouble: 2.5], nil];

	NSDictionary	*expectedValues	= [NSDictionary dictionaryWithObjects: values forKeys: keys];
	
	IMSRPointObject *point	= [[IMSRPointObject alloc] initWithPositionX: [[expectedValues objectForKey: @"positionX"] doubleValue]
															   positionY: [[expectedValues objectForKey: @"positionY"] doubleValue]
															   positionZ: [[expectedValues objectForKey: @"positionZ"] doubleValue]
															   velocityX: [[expectedValues objectForKey: @"velocityX"] doubleValue]
															   velocityY: [[expectedValues objectForKey: @"velocityY"] doubleValue]
															   velocityZ: [[expectedValues objectForKey: @"velocityZ"] doubleValue]];
	STAssertNotNil(point, @"Could not construct point");
	
	NSMutableDictionary	*state	= [point pointObject];
	STAssertNotNil(state, @"Could not get state from Object");
	
	NSNumber *expCount	= [NSNumber numberWithInt: 9];
	NSNumber *count		= [NSNumber numberWithInt: [state count]];
	STAssertTrue([count isEqualToNumber: expCount], 
				 @"Body state contains %@ elements. Should be %@", count, expCount);
	NSNumber *defaultValue = [NSNumber numberWithDouble: 0.0];
	int i = 0;
	
	for (id key in state)
	{
		NSNumber *value		= [state objectForKey: key];
		NSNumber *expValue	= [expectedValues objectForKey: key];
		STAssertNotNil(value, @"Value for key %@ is nil", key);
		
		if ([key isEqualToString: @"accelerationZ"] ||
			[key isEqualToString: @"accelerationX"] || 
			[key isEqualToString: @"accelerationY"])
		{
			STAssertTrue([value isEqualToNumber: defaultValue], 
						 @"%@ value is %@. Should be %@. Count: %d", key, value, defaultValue, i);
		}
		else
		{
			STAssertTrue([value isEqualToNumber: expValue],
						 @"%@ value is %@. Should be %@. Count: %d", key, value, expValue, i);
		}
		++i;
	}
					 
	[keys release];
	[values release];
	[point release];
}

- (void)testInitPointObjectWithPosition
{
	NSArray		*keys	= [[NSArray alloc] initWithObjects: @"positionX",
						   @"positionY", @"positionZ", nil];

	NSArray		*values	= [[NSArray alloc] initWithObjects: [NSNumber numberWithDouble: 1.0],
						   [NSNumber numberWithDouble: -1.5], [NSNumber numberWithDouble: 0.7], nil];	

	NSDictionary	*expectedValues	= [NSDictionary dictionaryWithObjects: values forKeys: keys];

	IMSRPointObject *point	= [[IMSRPointObject alloc] initWithPositionX: [[expectedValues objectForKey: @"positionX"] doubleValue]
															  positionY: [[expectedValues objectForKey: @"positionY"] doubleValue]
															  positionZ: [[expectedValues objectForKey: @"positionZ"] doubleValue]];
	STAssertNotNil(point, @"Could not construct IMSRPointObject with position only initializer");
	
	NSMutableDictionary *state	= [point pointObject];
	STAssertNotNil(state, @"Could not get state from point");
	
	NSNumber *count		= [NSNumber numberWithInt: [state count]];
	NSNumber *expCount	= [NSNumber numberWithInt: 9];
	STAssertTrue([count isEqualToNumber: expCount],
				 @"Dictionary has %@ elements. Should have %@", count, expCount);
	
	NSNumber *defaultValue	= [NSNumber numberWithDouble: 0.0];
	
	for (id key in state)
	{
		NSNumber *value		= [state objectForKey: key];
		NSNumber *expValue	= [expectedValues objectForKey: key];
		
		if ([key isEqualToString: @"positionX"] ||
			[key isEqualToString: @"positionY"] ||
			[key isEqualToString: @"positionZ"])
		{
			STAssertTrue([value isEqualToNumber: expValue],
						 @"Value for %@ is %@. Should be %@", key, value, expValue);
		}
		else
		{
			STAssertTrue([value isEqualToNumber: defaultValue],
						 @"Value for %@ is %@. Should be %@", key, value, defaultValue);
		}
	}
	
	[keys release];
	[values release];
	[point release];
}

- (void)testInitPointObject
{
	IMSRPointObject *point	= [[IMSRPointObject alloc] init];
	STAssertNotNil(point, @"Could not initialize point with default initializer");
	
	NSMutableDictionary *state = [point pointObject];
	STAssertNotNil(state, @"Could not get state for default initialized point object");
	
	NSNumber *count		= [NSNumber numberWithInt: [state count]];
	NSNumber *expCount	= [NSNumber numberWithInt: 9];
	STAssertTrue([count isEqualToNumber: expCount],
				 @"Count is %@. Should be %@", count, expCount);
	
	NSNumber *defaultValue = [NSNumber numberWithDouble: 0.0];
	for (id key in state)
	{
		NSNumber *value = [state objectForKey: key];
		STAssertTrue([value isEqualToNumber: defaultValue],
					 @"Value for %@ is %@. Should be %@", key, value, defaultValue);
	}
}

@end
