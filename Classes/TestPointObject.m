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
		self.inputVelocityZ = [[test objectForKey: @"inputVelocityZ"] doubleValue];
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

- (NSArray *)testResultsForTest: (Test *)test
					 usingPoint: (IMSRPointObject *)point
{
	NSMutableArray *failure = [[NSMutableArray alloc] init];
	if (point == nil)
	{
		test.testColor = [UIColor redColor];
		NSMutableDictionary *failedTest = [[NSMutableArray alloc] init];
		[failedTest setValue: [NSNull null] forKey: @"IMSRPointObject"];
		[failedTest setValue: @"notNil" forKey: @"IMSRPointObject"];
		[failure addObject: failedTest];
		[failedTest release];
	}
	
	if (point.positionX != self.resultPositionX)
	{
		test.testColor = [UIColor redColor];
		NSMutableDictionary *failedTest = [[NSMutableArray alloc] init];
		[failedTest setValue: [NSNumber numberWithDouble: point.positionX]
					   forKey: @"actualPositionX"];
		[failedTest setValue: [NSNumber numberWithDouble: self.resultPositionX]
					   forKey: @"expectedPositionX"];
		[failure addObject: failedTest];
		[failedTest release];
	}
	
	if (point.positionY != self.resultPositionY)
	{
		test.testColor = [UIColor redColor];
		NSMutableDictionary *failedTest = [[NSMutableArray alloc] init];
		[failedTest setValue: [NSNumber numberWithDouble: point.positionY]
					   forKey: @"actualPositionY"];
		[failedTest setValue: [NSNumber numberWithDouble: self.resultPositionY]
					   forKey: @"expectedPositionY"];
		[failure addObject: failedTest];
		[failedTest release];
	}
	
	if (point.positionZ != self.resultPositionZ)
	{
		test.testColor = [UIColor redColor];
		NSMutableDictionary *failedTest = [[NSMutableArray alloc] init];
		[failedTest setValue: [NSNumber numberWithDouble: point.positionZ]
					   forKey: @"actualPositionZ"];
		[failedTest setValue: [NSNumber numberWithDouble: self.resultPositionZ]
					   forKey: @"expectedPositionZ"];
		[failure addObject: failedTest];
		[failedTest release];
	}
	
	if (point.velocityX != self.resultVelocityX)
	{
		test.testColor = [UIColor redColor];
		NSMutableDictionary *failedTest = [[NSMutableArray alloc] init];
		[failedTest setValue: [NSNumber numberWithDouble: point.velocityX]
					   forKey: @"actualVelocityX"];
		[failedTest setValue: [NSNumber numberWithDouble: self.resultVelocityX]
					   forKey: @"expectedVelocityX"];
		[failure addObject: failedTest];
		[failedTest release];
	}
	
	if (point.velocityY != self.resultVelocityY)
	{
		test.testColor = [UIColor redColor];
		NSMutableDictionary *failedTest = [[NSMutableArray alloc] init];
		[failedTest setValue: [NSNumber numberWithDouble: point.velocityY]
					   forKey: @"actualVelocityY"];
		[failedTest setValue: [NSNumber numberWithDouble: self.resultVelocityY]
					   forKey: @"expectedVelocityY"];
		[failure addObject: failedTest];
		[failedTest release];
	}
	
	if (point.velocityZ != self.resultVelocityZ)
	{
		test.testColor = [UIColor redColor];
		NSMutableDictionary *failedTest = [[NSMutableArray alloc] init];
		[failedTest setValue: [NSNumber numberWithDouble: point.velocityZ]
					   forKey: @"actualVelocityZ"];
		[failedTest setValue: [NSNumber numberWithDouble: self.resultVelocityZ]
					   forKey: @"expectedVelocityZ"];
		[failure addObject: failedTest];
		[failedTest release];
	}
	
	if (point.accelerationX != self.resultAccelerationX)
	{
		test.testColor = [UIColor redColor];
		NSMutableDictionary *failedTest = [[NSMutableArray alloc] init];
		[failedTest setValue: [NSNumber numberWithDouble: point.accelerationX]
					   forKey: @"actualAccelerationX"];
		[failedTest setValue: [NSNumber numberWithDouble: self.resultAccelerationX]
					   forKey: @"expectedAccelerationX"];
		[failure addObject: failedTest];
		[failedTest release];
	}
	
	if (point.accelerationY != self.resultAccelerationY)
	{
		test.testColor = [UIColor redColor];
		NSMutableDictionary *failedTest = [[NSMutableArray alloc] init];
		[failedTest setValue: [NSNumber numberWithDouble: point.accelerationY]
					   forKey: @"actualAccelerationY"];
		[failedTest setValue: [NSNumber numberWithDouble: self.resultAccelerationY]
					   forKey: @"expectedAccelerationY"];
		[failure addObject: failedTest];
		[failedTest release];
	}
	
	if (point.accelerationZ != self.resultAccelerationZ)
	{
		test.testColor = [UIColor redColor];
		NSMutableDictionary *failedTest = [[NSMutableArray alloc] init];
		[failedTest setValue: [NSNumber numberWithDouble: point.accelerationZ]
					   forKey: @"actualAccelerationZ"];
		[failedTest setValue: [NSNumber numberWithDouble: self.resultAccelerationZ]
					   forKey: @"expectedAccelerationZ"];
		[failure addObject: failedTest];
		[failedTest release];
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
	else if ([self.testMethod isEqualToString: @"initWithPositionX:positionY:positionZ:velocityX:velocityY:velocityZ:"])
	{
		IMSRPointObject *point = [[IMSRPointObject alloc] initWithPositionX: self.inputPositionX
																  positionY: self.inputPositionY
																  positionZ: self.inputPositionZ
																  velocityX: self.inputVelocityX
																  velocityY: self.inputVelocityY
																  velocityZ: self.inputVelocityZ];
		failedTests = [self testResultsForTest: test
									usingPoint: point];
	}
}

@end
