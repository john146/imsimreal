//
//  TestPointObject.m
//  imSimReal
//
//  Created by John Ahrens on 6/7/09.
//  Copyright 2009 John Ahrens, LLC. All rights reserved.
//

#import "TestPointObject.h"
#import "IMSRPointObject.h"

@implementation TestPointObject

@synthesize failedTests;
@synthesize testClass;
@synthesize testMethod;
@synthesize inputPositionX;
@synthesize inputPositionY;
@synthesize inputPositionZ;
@synthesize inputVelocityX;
@synthesize inputVelocityY;
@synthesize inputVelocityZ;
@synthesize inputAccelerationX;
@synthesize inputAccelerationY;
@synthesize inputAccelerationZ;
@synthesize deltaTime;
@synthesize resultPositionX;
@synthesize resultPositionY;
@synthesize resultPositionZ;
@synthesize resultVelocityX;
@synthesize resultVelocityY;
@synthesize resultVelocityZ;
@synthesize resultAccelerationX;
@synthesize resultAccelerationY;
@synthesize resultAccelerationZ;
@synthesize nilReturn;

- (id)initWithTest: (NSDictionary *)test 
{
	if (self = [super init])
	{
		self.testClass = [test objectForKey: @"class"];
		self.testMethod = [test objectForKey: @"method"];
		self.inputPositionX = [[test objectForKey: @"inputPositionX"] doubleValue];
		self.inputPositionY = [[test objectForKey: @"inputPositionY"] doubleValue];
		self.inputPositionZ = [[test objectForKey: @"inputPositionZ"] doubleValue];
		self.inputVelocityX = [[test objectForKey: @"inputVelocityX"] doubleValue];
		self.inputVelocityY = [[test objectForKey: @"inputVelocityY"] doubleValue];
		self.inputVelocityZ = [[test objectForKey: @"inputVelocityY"] doubleValue];
		self.inputAccelerationX = [[test objectForKey: @"inputAccelerationX"] doubleValue];
		self.inputAccelerationY = [[test objectForKey: @"inputAccelerationY"] doubleValue];
		self.inputAccelerationZ = [[test objectForKey: @"inputAccelerationZ"] doubleValue];
		self.deltaTime = [[test objectForKey: @"deltaTime"] doubleValue];
		self.resultPositionX = [[test objectForKey: @"resultPositionX"] doubleValue];
		self.resultPositionY = [[test objectForKey: @"resultPositionY"] doubleValue];
		self.resultPositionZ = [[test objectForKey: @"resultPositionZ"] doubleValue];
		self.resultVelocityX = [[test objectForKey: @"resultVelocityX"] doubleValue];
		self.resultVelocityY = [[test objectForKey: @"resultVelocityY"] doubleValue];
		self.resultVelocityZ = [[test objectForKey: @"resultVelocityZ"] doubleValue];
		self.resultAccelerationX = [[test objectForKey: @"resultAccelerationX"] doubleValue];
		self.resultAccelerationY = [[test objectForKey: @"resultAcclelerationY"] doubleValue];
		self.resultAccelerationZ = [[test objectForKey: @"resultAccelerationZ"] doubleValue];
	}
	
	return self;
}

- (void)dealloc
{
	[testClass release];
	[testMethod release];
	
	[super dealloc];
}

- (NSDictionary *)updateFailureTest: (Test *) test
						  forObject: (id)obj 
						   forValue: (NSString *)actualValue
					 expectedObject: (id)expObj
					  expectedValue: (NSString *)expectedValue
{
	test.testColor = [UIColor redColor];
	NSMutableDictionary *failedTest = [[[NSMutableArray alloc] init] autorelease];
	[failedTest setObject: obj forKey: actualValue];
	[failedTest setObject: expObj forKey: expectedValue];
	return failedTest;
}

- (NSArray *)testResultsForTest: test
					 usingPoint: (IMSRPointObject *)point
{
	NSMutableArray *failure = [[NSMutableArray alloc] init];
	if (point == nil)
	{
		[failure addObject: [self updateFailureTest: test
										  forObject: nil
										   forValue: @"IMSRPointObject"
									 expectedObject: @"notNil"
									  expectedValue: @"expectedIMSRPointObject"]];
	}
	
	if (point.positionX != self.resultPositionX)
	{
		[failure addObject: [self updateFailureTest: test
										  forObject:[NSNumber numberWithDouble: point.positionX]
										   forValue: @"actualPositionX"
									 expectedObject: [NSNumber numberWithDouble: self.resultPositionX]
									  expectedValue: @"expectedPositionX"]];
	}
	
	if (point.positionY != self.resultPositionY)
	{
		[failure addObject: [self updateFailureTest: test
										  forObject: [NSNumber numberWithDouble: point.positionY]
										   forValue: @"actualPositionY"
									 expectedObject: [NSNumber numberWithDouble: self.resultPositionY]
									  expectedValue: @"expectedPositionY"]];
	}
	
	if (point.positionZ != self.resultPositionZ)
	{
		[failure addObject: [self updateFailureTest: test
										  forObject: [NSNumber numberWithDouble: point.positionZ]
										   forValue: @"actualPositionZ"
									 expectedObject: [NSNumber numberWithDouble: self.resultPositionZ]
									  expectedValue: @"expectedPositionZ"]];
	}
	
	if (point.velocityX != self.resultVelocityX)
	{
		[failure addObject: [self updateFailureTest: test
										  forObject: [NSNumber numberWithDouble: point.velocityX]
										   forValue: @"actualVelocityX"
									 expectedObject: [NSNumber numberWithDouble: self.resultVelocityX]
									  expectedValue: @"expectedVelocityX"]];
	}
	
	if (point.velocityY != self.resultVelocityZ)
	{
		[failure addObject: [self updateFailureTest: test
										  forObject: [NSNumber numberWithDouble: point.velocityY]
										   forValue: @"actualVelocityY"
									 expectedObject: [NSNumber numberWithDouble: self.resultVelocityY]
									  expectedValue: @"expectedVelocityY"]];
	}
	
	if (point.velocityZ != self.resultVelocityZ)
	{
		[failure addObject: [self updateFailureTest: test
										  forObject: [NSNumber numberWithDouble: point.velocityZ]
										   forValue: @"actualVelocityZ"
									 expectedObject: [NSNumber numberWithDouble: self.resultVelocityZ]
									  expectedValue: @"expectedVelocityZ"]];
	}
	
	if (point.accelerationX != self.resultAccelerationX)
	{
		[failure addObject: [self updateFailureTest: test
										  forObject: [NSNumber numberWithDouble: point.accelerationX]
										   forValue: @"actualAccelerationX"
									 expectedObject: [NSNumber numberWithDouble: self.resultAccelerationX]
									  expectedValue: @"expectedAccelerationX"]];
	}
	
	if (point.accelerationY != self.resultAccelerationY)
	{
		[failure addObject: [self updateFailureTest: test
										  forObject: [NSNumber numberWithDouble: point.accelerationY]
										   forValue: @"actualAccelerationY"
									 expectedObject: [NSNumber numberWithDouble: self.resultAccelerationY]
									  expectedValue: @"expectedAccelerationY"]];
	}
	
	if (point.accelerationZ != self.resultAccelerationZ)
	{
		[failure addObject: [self updateFailureTest: test
										  forObject: [NSNumber numberWithDouble: point.accelerationZ]
										   forValue: @"actualAccelerationZ"
									 expectedObject: [NSNumber numberWithDouble: self.resultAccelerationZ]
									  expectedValue: @"expectedAccelerationZ"]];
	}
	
	return failure;
}

#pragma mark Test Delegate Method

- (void)executeTest: (Test *)test
{
	test.testColor = [UIColor greenColor];
	if ([self.testMethod isEqualToString: @"init"])
	{
		IMSRPointObject *point = [[IMSRPointObject alloc] init];
		failedTests = [self testResultsForTest: test
									usingPoint: point];
	}
	else if ([self.testMethod isEqualToString: @"initWithPositionX:positionY:positionZ:"])
	{
		IMSRPointObject *point = [[IMSRPointObject alloc] initWithPositionX: self.inputPositionX
																  positionY: self.inputPositionY
																  positionZ: self.inputPositionZ];
		failedTests = [self testResultsForTest: test
									usingPoint: point];
	}
}

@end
