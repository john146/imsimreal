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

- (double)updatePosition: (double)position
			withVelocity: (double)velocity
		withAcceleration: (double)acceleration
			forDeltaTime: (NSTimeInterval)deltaTime
{
	return (position + (velocity * deltaTime) + ((acceleration * deltaTime * deltaTime) / 2.0));
}

- (double)updateVelocity: (double)velocity
		withAcceleration: (double)acceleration
			forDeltaTime: (NSTimeInterval)deltaTime
{
	return (velocity + (acceleration * deltaTime));
}

- (void)computeStateForDeltaTime: (NSTimeInterval)deltaTime
{
	self.positionX = [self updatePosition: self.positionX
							 withVelocity: self.velocityX
						 withAcceleration: self.accelerationX
							 forDeltaTime: deltaTime];
	self.velocityX	= [self updateVelocity: self.velocityX
						  withAcceleration: self.accelerationX
							  forDeltaTime: deltaTime];
	
	self.positionY = [self updatePosition: self.positionY
							 withVelocity: self.velocityY
						 withAcceleration: self.accelerationY
							 forDeltaTime: deltaTime];
	self.velocityY	= [self updateVelocity: self.velocityY
						  withAcceleration: self.accelerationY
						 	  forDeltaTime: deltaTime];
	
	self.positionZ = [self updatePosition: self.positionZ
							 withVelocity: self.velocityZ
						 withAcceleration: self.accelerationZ
							 forDeltaTime: deltaTime];
	self.velocityZ	= [self updateVelocity: self.velocityZ
						  withAcceleration: self.accelerationZ
							  forDeltaTime: deltaTime];
}

@end
