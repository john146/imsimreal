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

#pragma mark Test Delegate Method

- (void)executeTest: (Test *)test
{
	
}

@end
