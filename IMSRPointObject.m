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

- (id)initWithPositionX: (double)positionX positionY: (double)positionY positionZ: (double)positionZ
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

@end
