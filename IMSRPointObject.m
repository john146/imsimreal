//
//  IMSRPointObject.m
//  imSimReal
//
//  Created by John Ahrens on 12/27/08.
//  Copyright 2008 John Ahrens, LLC. All rights reserved.
//

#import "IMSRPointObject.h"

@implementation IMSRPointObject

@synthesize positionX;
@synthesize positionY;
@synthesize positionZ;
@synthesize velocityX;
@synthesize velocityY;
@synthesize velocityZ;
@synthesize accelerationX;
@synthesize accelerationY;
@synthesize accelerationZ;

- (id)initWithPositionX: (double)myPositionX 
			  positionY: (double)myPositionY 
			  positionZ: (double)myPositionZ
			  velocityX: (double)myVelocityX
			  velocityY: (double)myVelocityY
			  velocityZ: (double)myVelocityZ
		  accelerationX: (double)myAccelerationX
		  accelerationY: (double)myAccelerationY 
		  accelerationZ: (double)myAccelerationZ
{
	if (self = [super init])
	{
		self.positionX		= myPositionX;
		self.positionY		= myPositionY;
		self.positionZ		= myPositionZ;
		self.velocityX		= myVelocityX;
		self.velocityY		= myVelocityY;
		self.velocityZ		= myVelocityZ;
		self.accelerationX	= myAccelerationX;
		self.accelerationY	= myAccelerationY;
		self.accelerationZ	= myAccelerationZ;
	}
	
	return self;
}

- (id)initWithPositionX: (double)myPositionX
			  positionY: (double)myPositionY
			  positionZ: (double)myPositionZ
			  velocityX: (double)myVelocityX
			  velocityY: (double)myVelocityY
			  velocityZ: (double)myVelocityZ
{
	if (self = [super init])
	{
		self.positionX		= myPositionX;
		self.positionY		= myPositionY;
		self.positionZ		= myPositionZ;
		self.velocityX		= myVelocityX;
		self.velocityY		= myVelocityY;
		self.velocityZ		= myVelocityZ;
		self.accelerationX	= 0.0;
		self.accelerationY	= 0.0;
		self.accelerationZ	= 0.0;
	}
	
	return self;
}

- (id)initWithPositionX: (double)myPositionX 
			  positionY: (double)myPositionY 
			  positionZ: (double)myPositionZ
{
	if (self = [super init])
	{
		self.positionX		= myPositionX;
		self.positionY		= myPositionY;
		self.positionZ		= myPositionZ;
		self.velocityX		= 0.0;
		self.velocityY		= 0.0;
		self.velocityZ		= 0.0;
		self.accelerationX	= 0.0;
		self.accelerationY	= 0.0;
		self.accelerationZ	= 0.0;
	}
	
	return self;
}

- (id)init
{
	if (self = [super init])
	{
		self.positionX		= 0.0;
		self.positionY		= 0.0;
		self.positionZ		= 0.0;
		self.velocityX		= 0.0;
		self.velocityY		= 0.0;
		self.velocityZ		= 0.0;
		self.accelerationX	= 0.0;
		self.accelerationY	= 0.0;
		self.accelerationZ	= 0.0;
	}
	
	return self;
}

- (void)updatePosition: (NSNumber *)pos
			  velocity: (NSNumber *)vel
		  acceleration: (NSNumber *)accel
		  forDeltaTime: (NSTimeInterval)deltaTime
{
	NSLog(@"Entering updatePosition: %@ velocity:%@ acceleration: %@ forDeltaTime: %d",
		  pos, vel, accel, deltaTime);
	
	double		position		= [pos doubleValue];
	double		velocity		= [vel doubleValue];
	double		acceleration	= [accel doubleValue];
	
	position		= position + (velocity * deltaTime) + ((acceleration * deltaTime * deltaTime) / 2.0);
	pos				= [NSNumber numberWithDouble: position];
	velocity		= velocity + (acceleration * deltaTime);
	vel				= [NSNumber numberWithDouble: velocity];
	
	NSLog(@"Position: %@ velocity: %@", pos, vel);
}

- (void)computeStateForDeltaTime: (NSTimeInterval)deltaTime
{
	NSNumber *position;
	NSNumber *velocity;
	NSNumber *acceleration;
	
	position = [NSNumber numberWithDouble: self.positionX];
	velocity = [NSNumber numberWithDouble: self.velocityX];
	acceleration = [NSNumber numberWithDouble: self.accelerationX];
	[self updatePosition: position 
				velocity: velocity
			acceleration: acceleration
			forDeltaTime: deltaTime];
	self.positionX		= [position doubleValue];
	self.velocityX		= [velocity doubleValue];
	
	position			= [NSNumber numberWithDouble: self.positionY];
	velocity			= [NSNumber numberWithDouble: self.velocityY];
	acceleration		= [NSNumber numberWithDouble: self.accelerationY];
	[self updatePosition: position 
				velocity: velocity
			acceleration: acceleration
			forDeltaTime: deltaTime];
	self.positionY		= [position doubleValue];
	self.velocityY		= [velocity doubleValue];
	
	position			= [NSNumber numberWithDouble: self.positionZ];
	velocity			= [NSNumber numberWithDouble: self.velocityZ];
	acceleration		= [NSNumber numberWithDouble: self.accelerationZ];
	[self updatePosition: position 
				velocity: velocity
			acceleration: acceleration
			forDeltaTime: deltaTime];
	self.positionZ		= [position doubleValue];
	self.velocityZ		= [velocity doubleValue];
}

@end
