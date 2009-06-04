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

- (void)setUp
{
	pointObj	= [[IMSRPointObject alloc] init];
}

- (void)tearDown
{
	[pointObj release];
}

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

- (void)testUpdatePosition
{
	double positionX	= 1.5;
	double positionY	= -2.5;
	double positionZ	= 34.7;
	
	STAssertNotNil(pointObj, @"Point not created");
	STAssertEquals([pointObj positionX], 0.0, @"PositionX is %f. Should be 0.0", [pointObj positionX]);
	STAssertEquals([pointObj positionY], 0.0, @"PositionY is %f. Should be 0.0", [pointObj positionY]);
	STAssertEquals([pointObj positionZ], 0.0, @"PositionZ is %f. Should be 0.0", [pointObj positionZ]);

	[pointObj updatePositionX: positionX positionY: positionY positionZ: positionZ];
	STAssertEquals([pointObj positionX], positionX, @"PositionX is %f. Should be %f", [pointObj positionX], positionX);
	STAssertEquals([pointObj positionY], positionY, @"PositionY is %f. Should be %f", [pointObj positionY], positionY);
	STAssertEquals([pointObj positionZ], positionZ, @"PositionZ is %f. Should be %f", [pointObj positionZ], positionZ);
}

- (void)testUpdateVelocity
{
	double velocityX	= 0.3;
	double velocityY	= -0.2;
	double velocityZ	= -0.4;
	
	STAssertNotNil(pointObj, @"Point not created");
	STAssertEquals([pointObj velocityX], 0.0, @"VelocityX is %f. Should be 0.0", [pointObj velocityX]);
	STAssertEquals([pointObj velocityY], 0.0, @"VelocityY is %f. Should be 0.0", [pointObj velocityY]);
	STAssertEquals([pointObj velocityZ], 0.0, @"VelocityZ is %f. Should be 0.0", [pointObj velocityZ]);
	
	[pointObj updateVelocityX: velocityX velocityY: velocityY velocityZ: velocityZ];
	STAssertEquals([pointObj velocityX], velocityX, @"VelocityX is %f. Should be %f", [pointObj velocityX], velocityX);
	STAssertEquals([pointObj velocityY], velocityY, @"VelocityY is %f. Should be %f", [pointObj velocityY], velocityY);
	STAssertEquals([pointObj velocityZ], velocityZ, @"VelocityZ is %f. Should be %f", [pointObj velocityZ], velocityZ);
}

- (void)testUpdateAcceleration
{
	double accelerationX	= 0.1;
	double accelerationY	= -0.5;
	double accelerationZ	= -9.81;
	
	STAssertNotNil(pointObj, @"Point not created");
	STAssertEquals([pointObj accelerationX], 0.0, @"AccelerationX is %f. Should be 0.0", [pointObj accelerationX]);
	STAssertEquals([pointObj accelerationY], 0.0, @"AccelerationY is %f. Should be 0.0", [pointObj accelerationY]);
	STAssertEquals([pointObj accelerationZ], 0.0, @"AccelerationZ is %f. Should be 0.0", [pointObj accelerationZ]);
	
	[pointObj updateAccelerationX: accelerationX accelerationY: accelerationY accelerationZ: accelerationZ];
	STAssertEquals([pointObj accelerationX], accelerationX, 
				   @"AccelerationX is %f. Should be %f", [pointObj accelerationX], accelerationX);
	STAssertEquals([pointObj accelerationY], accelerationY,
				   @"AccelerationY is %f. Should be %f", [pointObj accelerationY], accelerationY);
	STAssertEquals([pointObj accelerationZ], accelerationZ,
				   @"AccelerationZ is %f. Should be %f", [pointObj accelerationZ], accelerationZ);
}

- (void)testComputeStateForDeltaTime
{
	double positionX		= 10.0;
	double positionY		= 10.0;
	double positionZ		= 10.0;
	double velocityX		= 0.1;
	double velocityY		= -0.1;
	double velocityZ		= 0.001;
	double accelerationX	= 0.01;
	double accelerationY	= 0.01;
	double accelerationZ	= -9.81;
	
	STAssertNotNil(pointObj, @"Point not created");
	
	[pointObj updatePositionX: positionX positionY: positionY positionZ: positionZ];
	STAssertEquals([pointObj positionX], positionX,
				   @"PositionX is %f. Should be %f.", [pointObj positionX], positionX);
	STAssertEquals([pointObj positionY], positionY,
				   @"PositionY is %f. Should be %f.", [pointObj positionY], positionY);
	STAssertEquals([pointObj positionZ], positionZ,
				   @"PositionZ is %f. Should be %f.", [pointObj positionZ], positionZ);
	
	[pointObj updateVelocityX: velocityX velocityY: velocityY velocityZ: velocityZ];
	STAssertEquals([pointObj velocityX], velocityX,
				   @"VelocityX is %f. Should be %f.", [pointObj velocityX], velocityX);
	STAssertEquals([pointObj velocityY], velocityY,
				   @"VelocityY is %f. Should be %f.", [pointObj velocityY], velocityY);
	STAssertEquals([pointObj velocityZ], velocityZ,
				   @"VelocityZ is %f. Should be %f.", [pointObj velocityZ], velocityZ);
	
	[pointObj updateAccelerationX: accelerationX 
					accelerationY: accelerationY
					accelerationZ: accelerationZ];
	STAssertEquals([pointObj accelerationX], accelerationX,
				   @"AccelerationX is %f. Should be %f.", [pointObj accelerationX], accelerationX);
	STAssertEquals([pointObj accelerationY], accelerationY,
				   @"AccelerationY is %f. Should be %f.", [pointObj accelerationY], accelerationY);
	STAssertEquals([pointObj accelerationZ], accelerationZ,
				   @"AccelerationZ is %f. Should be %f.", [pointObj accelerationZ], accelerationZ);
	
	NSTimeInterval deltaTime = 0.1;
	[pointObj computeStateForDeltaTime: deltaTime];
	double	pos = positionX + (velocityX * deltaTime) + (accelerationX * deltaTime * deltaTime) / 2.0;
	double	vel = velocityX + (accelerationX * deltaTime);
	STAssertEquals([pointObj positionX], pos,
				   @"PositionX is %f. Should be %f.", [pointObj positionX], pos);
	STAssertEquals([pointObj velocityX], vel,
				   @"VelocityX is %f. Should be %f.", [pointObj velocityX], vel);
	
	pos	= positionY + (velocityY * deltaTime) + (accelerationY * deltaTime * deltaTime) / 2.0;
	vel	= velocityY + (accelerationY * deltaTime);
	STAssertEquals([pointObj positionY], pos,
				   @"PositionY is %f. Should be %f.", [pointObj positionY], pos);
	STAssertEquals([pointObj velocityY], vel,
				   @"VelocityY is %F. Should be %f.", [pointObj velocityY], vel);
	
	pos = positionZ + (velocityZ * deltaTime) + (accelerationZ * deltaTime * deltaTime) / 2.0;
	vel = velocityZ + (accelerationZ * deltaTime);
	STAssertEquals([pointObj positionZ], pos,
				   @"PositionZ is %f. Should be %f.", [pointObj positionZ], pos);
	STAssertEquals([pointObj velocityZ], vel,
				   @"VelocityZ is %F. Should be %f.", [pointObj velocityZ], vel);
}

@end
