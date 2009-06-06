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

- (NSMutableDictionary *)setPointObjectWithPositionX: (double)positionX 
										   positionY: (double)positionY 
										   positionZ: (double)positionZ 
										   velocityX: (double)velocityX 
										   velocityY: (double)velocityY 
										   velocityZ: (double)velocityZ
									   accelerationX: (double)accelerationX 
									   accelerationY: (double)accelerationY
									   accelerationZ: (double)accelerationZ
{
	NSArray *keys = [[NSArray alloc] initWithObjects: @"positionX", @"positionY", @"positionZ",
					 @"velocityX", @"velocityY", @"velocityZ", 
					 @"accelerationX", @"accelerationY", @"accelerationZ", nil];
	NSArray *values	= [[NSArray alloc] initWithObjects: [NSNumber numberWithDouble: positionX],
					   [NSNumber numberWithDouble: positionY], [NSNumber numberWithDouble: positionZ],
					   [NSNumber numberWithDouble: velocityX], [NSNumber numberWithDouble: velocityY],
					   [NSNumber numberWithDouble: velocityZ], [NSNumber numberWithDouble: accelerationX],
					   [NSNumber numberWithDouble: accelerationY], [NSNumber numberWithDouble: accelerationZ], nil];
	
	return [NSMutableDictionary dictionaryWithObjects: values forKeys: keys];
}

- (id)initWithPositionX: (double)positionX 
			  positionY: (double)positionY 
			  positionZ: (double)positionZ
			  velocityX: (double)velocityX
			  velocityY: (double)velocityY
			  velocityZ: (double)velocityZ
		  accelerationX: (double)accelerationX
		  accelerationY: (double)accelerationY 
		  accelerationZ: (double)accelerationZ
{
	if (![super init])
	{
		return nil;
	}
	
	pointObject = [self setPointObjectWithPositionX: positionX 
										  positionY: positionY 
										  positionZ: positionZ
										  velocityX: velocityX
										  velocityY: velocityY 
										  velocityZ: velocityZ
									  accelerationX: accelerationX
									  accelerationY: accelerationY
									  accelerationZ: accelerationZ];
	
	return self;
}

- (id)initWithPositionX: (double)positionX
			  positionY: (double)positionY
			  positionZ: (double)positionZ
			  velocityX: (double)velocityX
			  velocityY: (double)velocityY
			  velocityZ: (double)velocityZ
{
	if (![super init])
	{
		return nil;
	}
	
	pointObject = [self setPointObjectWithPositionX: positionX
										  positionY: positionY 
										  positionZ: positionZ
										  velocityX: velocityX
										  velocityY: velocityY
										  velocityZ: velocityZ
									  accelerationX: 0.0
									  accelerationY: 0.0 
									  accelerationZ: 0.0];
	
	return self;
}

- (id)initWithPositionX: (double)positionX 
			  positionY: (double)positionY 
			  positionZ: (double)positionZ
{
	if (![super init])
	{
		return nil;
	}
	
	pointObject = [self setPointObjectWithPositionX: positionX
										  positionY: positionY
										  positionZ: positionZ
										  velocityX: 0.0
										  velocityY: 0.0
										  velocityZ: 0.0
									  accelerationX: 0.0
									  accelerationY: 0.0
									  accelerationZ: 0.0];
	
	return self;
}

- (id)init
{
	if (![super init])
	{
		return nil;
	}
	
	pointObject = [self setPointObjectWithPositionX: 0.0
										  positionY: 0.0
										  positionZ: 0.0
										  velocityX: 0.0
										  velocityY: 0.0
										  velocityZ: 0.0
									  accelerationX: 0.0
									  accelerationY: 0.0 
									  accelerationZ: 0.0];
	
	return self;
}

- (double)positionX
{
	NSNumber *value = [pointObject objectForKey: @"positionX"];
	return [value doubleValue];
}

- (double)positionY
{
	NSNumber *value = [pointObject objectForKey: @"positionY"];
	return [value doubleValue];
}

- (double)positionZ
{
	NSNumber *value = [pointObject objectForKey: @"positionZ"];
	return [value doubleValue];
}

- (double)velocityX
{
	NSNumber *value = [pointObject objectForKey: @"velocityX"];
	return [value doubleValue];
}

- (double)velocityY
{
	NSNumber *value = [pointObject objectForKey: @"velocityY"];
	return [value doubleValue];
}

- (double)velocityZ
{
	NSNumber *value = [pointObject objectForKey: @"velocityZ"];
	return [value doubleValue];
}

- (double)accelerationX
{
	NSNumber *value = [pointObject objectForKey: @"accelerationX"];
	return [value doubleValue];
}

- (double)accelerationY
{
	NSNumber *value = [pointObject objectForKey: @"accelerationY"];
	return [value doubleValue];
}

- (double)accelerationZ
{
	NSNumber *value = [pointObject objectForKey: @"accelerationZ"];
	return [value doubleValue];
}

- (void)updatePositionX: (double)positionX 
			  positionY: (double)positionY 
			  positionZ: (double)positionZ
{
	[pointObject setObject: [NSNumber numberWithDouble: positionX] forKey: @"positionX"];
	[pointObject setObject: [NSNumber numberWithDouble: positionY] forKey: @"positionY"];
	[pointObject setObject: [NSNumber numberWithDouble: positionZ] forKey: @"positionZ"];
}

- (void)updateVelocityX: (double)velocityX
			  velocityY: (double)velocityY
			  velocityZ: (double)velocityZ
{
	[pointObject setObject: [NSNumber numberWithDouble: velocityX] forKey: @"velocityX"];
	[pointObject setObject: [NSNumber numberWithDouble: velocityY] forKey: @"velocityY"];
	[pointObject setObject: [NSNumber numberWithDouble: velocityZ] forKey: @"velocityZ"];
}
- (void)updateAccelerationX: (double)accelerationX
			  accelerationY: (double)accelerationY
			  accelerationZ: (double)accelerationZ
{
	[pointObject setObject: [NSNumber numberWithDouble: accelerationX] forKey: @"accelerationX"];
	[pointObject setObject: [NSNumber numberWithDouble: accelerationY] forKey: @"accelerationY"];
	[pointObject setObject: [NSNumber numberWithDouble: accelerationZ] forKey: @"accelerationZ"];
}

- (void)updateCoordinate: (NSString *)coordinate forDeltaTime: (NSTimeInterval)deltaTime
{
	NSNumber	*newNumber;
	double		position;
	double		velocity;
	double		acceleration;
	
	NSString	*pos	= [[NSString alloc] initWithFormat: @"position%@", coordinate];
	NSString	*vel	= [[NSString alloc] initWithFormat: @"velocity%@", coordinate];
	NSString	*accel	= [[NSString alloc] initWithFormat: @"acceleration%@", coordinate];
	
	newNumber		= [pointObject objectForKey: pos];
	position		= [newNumber doubleValue];
	newNumber		= [pointObject objectForKey: vel];
	velocity		= [newNumber doubleValue];
	newNumber		= [pointObject objectForKey: accel];
	acceleration	= [newNumber doubleValue];

	position		= position + (velocity * deltaTime) + ((acceleration * deltaTime * deltaTime) / 2.0);
	[pointObject setObject: [NSNumber numberWithDouble: position] forKey: pos];
	velocity		= velocity + (acceleration * deltaTime);
	[pointObject setObject: [NSNumber numberWithDouble: velocity] forKey: vel];
	
	[pos release];
	[vel release];
	[accel release];
}

- (void)computeStateForDeltaTime: (NSTimeInterval)deltaTime
{
	[self updateCoordinate: @"X" forDeltaTime: deltaTime];
	[self updateCoordinate: @"Y" forDeltaTime: deltaTime];
	[self updateCoordinate: @"Z" forDeltaTime: deltaTime];
}

@end
