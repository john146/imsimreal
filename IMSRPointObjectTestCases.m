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
	double expected			= 0.0;
	NSNumber *expValue		= [NSNumber numberWithDouble: expected];

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
	
	STAssertEquals(point1.positionX, expected, @"X position should be %i but is %i", expected, point1.positionX);
	STAssertEquals(point1.positionY, 
				   expected, 
				   @"Y position should be %i but is %i", 
				   expected,
				   point1.positionY);
	STAssertEquals(point1.positionX, expected, @"Z position should be %i but is %i", expected, point1.positionZ);
	STAssertEquals(point1.velocityX, expected, @"X velocity should be %i but is %i", expected, point1.velocityX);
	STAssertEquals(point1.velocityY, expected, @"Y velocity should be %i but is %i", expected, point1.velocityY);
	STAssertEquals(point1.velocityZ, expected, @"Z velocity should be %i but is %i", expected, point1.velocityZ);
	STAssertEquals(point1.accelerationX, expected, @"X acceleration should be %i but is %i", expected, point1.accelerationX);
	STAssertEquals(point1.accelerationY, expected, @"Y acceleration should be %i but is %i", expected, point1.accelerationY);
	STAssertEquals(point1.accelerationZ, expected, @"Z acceleration should be %i but is %i", expected, point1.accelerationZ);
		
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
	
	STAssertEquals(point2.positionX,
				   [[expValues objectForKey: @"positionX"] doubleValue], 
				   @"Position X should be %i but is %i", 
				   [[expValues objectForKey: @"positionX"] doubleValue],
				   point2.positionX);
	STAssertEquals(point2.positionY,
				   [[expValues objectForKey: @"positionY"] doubleValue], 
				   @"Position Y should be %i but is %i", 
				   [[expValues objectForKey: @"positionY"] doubleValue],
				   point2.positionY);
	STAssertEquals(point2.positionX,
				   [[expValues objectForKey: @"positionZ"] doubleValue], 
				   @"Position Z should be %i but is %i", 
				   [[expValues objectForKey: @"positionZ"] doubleValue],
				   point2.positionZ);
	STAssertEquals(point2.velocityX,
				   [[expValues objectForKey: @"velocityX"] doubleValue], 
				   @"Velocity X should be %i but is %i", 
				   [[expValues objectForKey: @"velocityX"] doubleValue],
				   point2.velocityX);
	STAssertEquals(point2.velocityY,
				   [[expValues objectForKey: @"velocityY"] doubleValue], 
				   @"Velocity Y should be %i but is %i", 
				   [[expValues objectForKey: @"velocityY"] doubleValue],
				   point2.velocityY);
	STAssertEquals(point2.velocityZ,
				   [[expValues objectForKey: @"velocityZ"] doubleValue], 
				   @"Velocity Z should be %i but is %i", 
				   [[expValues objectForKey: @"velocityZ"] doubleValue],
				   point2.velocityZ);
	STAssertEquals(point2.accelerationX,
				   [[expValues objectForKey: @"accelerationX"] doubleValue], 
				   @"Acceleration X should be %i but is %i", 
				   [[expValues objectForKey: @"accelerationX"] doubleValue],
				   point2.accelerationX);
	STAssertEquals(point2.accelerationY,
				   [[expValues objectForKey: @"accelerationY"] doubleValue], 
				   @"Acceleration Y should be %i but is %i", 
				   [[expValues objectForKey: @"accelerationY"] doubleValue],
				   point2.accelerationY);
	STAssertEquals(point2.accelerationZ,
				   [[expValues objectForKey: @"accelerationZ"] doubleValue], 
				   @"Acceleration Z should be %i but is %i", 
				   [[expValues objectForKey: @"accelerationZ"] doubleValue],
				   point2.accelerationZ);
	
	[keys release];
	[values release];
	[point1 release];
	[point2 release];
}

- (void)testInitPointObjectWithPositionAndVelocity
{
	NSArray	*keys			= [[NSArray alloc] initWithObjects: @"positionX",
							   @"positionY", @"positionZ", @"velocityX",
							   @"velocityY", @"velocityZ", @"accelerationX",
							   @"accelerationY", @"accelerationX", nil];
	
	NSArray		*values	= [[NSArray alloc] initWithObjects: [NSNumber numberWithDouble: 1.0],
						   [NSNumber numberWithDouble: -1.5], [NSNumber numberWithDouble: 0.7],
						   [NSNumber numberWithDouble: 3.0], [NSNumber numberWithDouble: -3.5],
						   [NSNumber numberWithDouble: 2.5], [NSNumber numberWithDouble: 0.0],
						   [NSNumber numberWithDouble: 0.0], [NSNumber numberWithDouble: 0.0], nil];

	NSDictionary	*expectedValues	= [NSDictionary dictionaryWithObjects: values forKeys: keys];
	
	IMSRPointObject *point	= [[IMSRPointObject alloc] initWithPositionX: [[expectedValues objectForKey: @"positionX"] doubleValue]
															   positionY: [[expectedValues objectForKey: @"positionY"] doubleValue]
															   positionZ: [[expectedValues objectForKey: @"positionZ"] doubleValue]
															   velocityX: [[expectedValues objectForKey: @"velocityX"] doubleValue]
															   velocityY: [[expectedValues objectForKey: @"velocityY"] doubleValue]
															   velocityZ: [[expectedValues objectForKey: @"velocityZ"] doubleValue]];
	STAssertNotNil(point, @"Could not construct point");
	
	STAssertEquals(point.positionX,
				   [[expectedValues objectForKey: @"positionX"] doubleValue], 
				   @"Position X should be %i but is %i", 
				   [[expectedValues objectForKey: @"positionX"] doubleValue],
				   point.positionX);
	STAssertEquals(point.positionY,
				   [[expectedValues objectForKey: @"positionY"] doubleValue], 
				   @"Position Y should be %i but is %i", 
				   [[expectedValues objectForKey: @"positionY"] doubleValue],
				   point.positionY);
	STAssertEquals(point.positionZ,
				   [[expectedValues objectForKey: @"positionZ"] doubleValue], 
				   @"Position Z should be %i but is %i", 
				   [[expectedValues objectForKey: @"positionZ"] doubleValue],
				   point.positionZ);
	STAssertEquals(point.velocityX,
				   [[expectedValues objectForKey: @"velocityX"] doubleValue], 
				   @"Velocity X should be %i but is %i", 
				   [[expectedValues objectForKey: @"velocityX"] doubleValue],
				   point.velocityX);
	STAssertEquals(point.velocityY,
				   [[expectedValues objectForKey: @"velocityY"] doubleValue], 
				   @"Velocity Y should be %i but is %i", 
				   [[expectedValues objectForKey: @"velocityY"] doubleValue],
				   point.velocityY);
	STAssertEquals(point.velocityZ,
				   [[expectedValues objectForKey: @"velocityZ"] doubleValue], 
				   @"Velocity Z should be %i but is %i", 
				   [[expectedValues objectForKey: @"velocityZ"] doubleValue],
				   point.velocityZ);
	STAssertEquals(point.accelerationX,
				   [[expectedValues objectForKey: @"accelerationX"] doubleValue], 
				   @"Acceleration X should be %i but is %i", 
				   [[expectedValues objectForKey: @"accelerationX"] doubleValue],
				   point.accelerationX);
	STAssertEquals(point.accelerationY,
				   [[expectedValues objectForKey: @"accelerationY"] doubleValue], 
				   @"Acceleration Y should be %i but is %i", 
				   [[expectedValues objectForKey: @"accelerationY"] doubleValue],
				   point.accelerationY);
	STAssertEquals(point.accelerationZ,
				   [[expectedValues objectForKey: @"accelerationZ"] doubleValue], 
				   @"Acceleration Z should be %i but is %i", 
				   [[expectedValues objectForKey: @"accelerationZ"] doubleValue],
				   point.accelerationZ);
						 
	[keys release];
	[values release];
	[point release];
}

- (void)testInitPointObjectWithPosition
{
	NSArray	*keys			= [[NSArray alloc] initWithObjects: @"positionX",
							   @"positionY", @"positionZ", @"velocityX",
							   @"velocityY", @"velocityZ", @"accelerationX",
							   @"accelerationY", @"accelerationX", nil];
	
	NSArray		*values	= [[NSArray alloc] initWithObjects: [NSNumber numberWithDouble: 1.0],
						   [NSNumber numberWithDouble: -1.5], [NSNumber numberWithDouble: 0.7],
						   [NSNumber numberWithDouble: 0.0], [NSNumber numberWithDouble: 0.0],
						   [NSNumber numberWithDouble: 0.0], [NSNumber numberWithDouble: 0.0],
						   [NSNumber numberWithDouble: 0.0], [NSNumber numberWithDouble: 0.0], nil];
	
	NSDictionary	*expectedValues	= [NSDictionary dictionaryWithObjects: values forKeys: keys];

	IMSRPointObject *point	= [[IMSRPointObject alloc] initWithPositionX: [[expectedValues objectForKey: @"positionX"] doubleValue]
															  positionY: [[expectedValues objectForKey: @"positionY"] doubleValue]
															  positionZ: [[expectedValues objectForKey: @"positionZ"] doubleValue]];
	STAssertNotNil(point, @"Could not construct IMSRPointObject with position only initializer");
	
	STAssertEquals(point.positionX,
				   [[expectedValues objectForKey: @"positionX"] doubleValue], 
				   @"Position X should be %i but is %i", 
				   [[expectedValues objectForKey: @"positionX"] doubleValue],
				   point.positionX);
	STAssertEquals(point.positionY,
				   [[expectedValues objectForKey: @"positionY"] doubleValue], 
				   @"Position Y should be %i but is %i", 
				   [[expectedValues objectForKey: @"positionY"] doubleValue],
				   point.positionY);
	STAssertEquals(point.positionZ,
				   [[expectedValues objectForKey: @"positionZ"] doubleValue], 
				   @"Position Z should be %i but is %i", 
				   [[expectedValues objectForKey: @"positionZ"] doubleValue],
				   point.positionZ);
	STAssertEquals(point.velocityX,
				   [[expectedValues objectForKey: @"velocityX"] doubleValue], 
				   @"Velocity X should be %i but is %i", 
				   [[expectedValues objectForKey: @"velocityX"] doubleValue],
				   point.velocityX);
	STAssertEquals(point.velocityY,
				   [[expectedValues objectForKey: @"velocityY"] doubleValue], 
				   @"Velocity Y should be %i but is %i", 
				   [[expectedValues objectForKey: @"velocityY"] doubleValue],
				   point.velocityY);
	STAssertEquals(point.velocityZ,
				   [[expectedValues objectForKey: @"velocityZ"] doubleValue], 
				   @"Velocity Z should be %i but is %i", 
				   [[expectedValues objectForKey: @"velocityZ"] doubleValue],
				   point.velocityZ);
	STAssertEquals(point.accelerationX,
				   [[expectedValues objectForKey: @"accelerationX"] doubleValue], 
				   @"Acceleration X should be %i but is %i", 
				   [[expectedValues objectForKey: @"accelerationX"] doubleValue],
				   point.accelerationX);
	STAssertEquals(point.accelerationY,
				   [[expectedValues objectForKey: @"accelerationY"] doubleValue], 
				   @"Acceleration Y should be %i but is %i", 
				   [[expectedValues objectForKey: @"accelerationY"] doubleValue],
				   point.accelerationY);
	STAssertEquals(point.accelerationZ,
				   [[expectedValues objectForKey: @"accelerationZ"] doubleValue], 
				   @"Acceleration Z should be %i but is %i", 
				   [[expectedValues objectForKey: @"accelerationZ"] doubleValue],
				   point.accelerationZ);
	
	[keys release];
	[values release];
	[point release];
}

- (void)testInitPointObject
{
	IMSRPointObject *point	= [[IMSRPointObject alloc] init];
	STAssertNotNil(point, @"Could not initialize point with default initializer");
	
	STAssertEquals(point.positionX, 0.0, @"Expected X position 0.0 but is %i", point.positionX);
	STAssertEquals(point.positionY, 0.0, @"Expected Y position 0.0 but is %i", point.positionY);
	STAssertEquals(point.positionZ, 0.0, @"Expected Z position 0.0 but is %i", point.positionZ);
	STAssertEquals(point.velocityX, 0.0, @"Expected X velocity 0.0 but is %i", point.velocityX);
	STAssertEquals(point.velocityY, 0.0, @"Expected Y velocity 0.0 but is %i", point.velocityY);
	STAssertEquals(point.velocityZ, 0.0, @"Expected Z velocity 0.0 but is %i", point.velocityZ);
	STAssertEquals(point.accelerationX, 0.0, @"Expected X acceleration 0.0 but is %i", point.accelerationX);
	STAssertEquals(point.accelerationY, 0.0, @"Expected Y acceleration 0.0 but is %i", point.accelerationY);
	STAssertEquals(point.accelerationZ, 0.0, @"Expected Z acceleration 0.0 but is %i", point.accelerationZ);
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
	
	pointObj.positionX		= positionX;
	STAssertEquals(pointObj.positionX,
				   positionX,
				   @"PositionX is %f. Should be %f.", 
				   pointObj.positionX, 
				   positionX);

	pointObj.positionY		= positionY;
	STAssertEquals(pointObj.positionY, positionY,
				   @"PositionY is %f. Should be %f.", pointObj.positionY, positionY);
	
	pointObj.positionZ		= positionZ;
	STAssertEquals(pointObj.positionZ, positionZ,
				   @"PositionZ is %f. Should be %f.", pointObj.positionZ, positionZ);

	pointObj.velocityX		= velocityX;
	STAssertEquals(pointObj.velocityX, velocityX,
				   @"VelocityX is %f. Should be %f.", pointObj.velocityX, velocityX);
	
	pointObj.velocityY		= velocityY;
	STAssertEquals(pointObj.velocityY, velocityY,
				   @"VelocityY is %f. Should be %f.", pointObj.velocityY, velocityY);
	
	pointObj.velocityZ		= velocityZ;
	STAssertEquals(pointObj.velocityZ, velocityZ,
				   @"VelocityZ is %f. Should be %f.", pointObj.velocityZ, velocityZ);

	pointObj.accelerationX	= accelerationX;
	STAssertEquals(pointObj.accelerationX, accelerationX,
				   @"AccelerationX is %f. Should be %f.", pointObj.accelerationX, accelerationX);
	
	pointObj.accelerationY	= accelerationY;
	STAssertEquals(pointObj.accelerationY, accelerationY,
				   @"AccelerationY is %f. Should be %f.", pointObj.accelerationY, accelerationY);
	
	pointObj.accelerationZ	= accelerationZ;
	STAssertEquals(pointObj.accelerationZ, accelerationZ,
				   @"AccelerationZ is %f. Should be %f.", pointObj.accelerationZ, accelerationZ);
	
	NSTimeInterval deltaTime = 0.1;
	[pointObj computeStateForDeltaTime: deltaTime];
	double	pos = positionX + (velocityX * deltaTime) + (accelerationX * deltaTime * deltaTime) / 2.0;
	double	vel = velocityX + (accelerationX * deltaTime);
	STAssertEqualsWithAccuracy(pointObj.positionX, pos, 0.00001,
				   @"PositionX is %f. Should be %f.", pointObj.positionX, pos);
	STAssertEquals(pointObj.velocityX, vel,
				   @"VelocityX is %f. Should be %f.", pointObj.velocityX, vel);
	
	pos	= positionY + (velocityY * deltaTime) + (accelerationY * deltaTime * deltaTime) / 2.0;
	vel	= velocityY + (accelerationY * deltaTime);
	STAssertEquals(pointObj.positionY, pos,
				   @"PositionY is %f. Should be %f.", pointObj.positionY, pos);
	STAssertEquals(pointObj.velocityY, vel,
				   @"VelocityY is %F. Should be %f.", pointObj.velocityY, vel);
	
	pos = positionZ + (velocityZ * deltaTime) + (accelerationZ * deltaTime * deltaTime) / 2.0;
	vel = velocityZ + (accelerationZ * deltaTime);
	STAssertEquals(pointObj.positionZ, pos,
				   @"PositionZ is %f. Should be %f.", pointObj.positionZ, pos);
	STAssertEquals(pointObj.velocityZ, vel,
				   @"VelocityZ is %F. Should be %f.", pointObj.velocityZ, vel);
}

@end
