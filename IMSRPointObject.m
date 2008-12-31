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
	NSNumber *x = [pointObject objectForKey: @"positionX"];
	return [x doubleValue];
}

- (double)positionY
{
	NSNumber *y = [pointObject objectForKey: @"positionY"];
	return [y doubleValue];
}

- (double)positionZ
{
	NSNumber *z = [pointObject objectForKey: @"positionZ"];
	return [z doubleValue];
}

- (void)updatePositionX: (double)positionX 
			  positionY: (double)positionY 
			  positionZ: (double)positionZ
{
	[pointObject setObject: [NSNumber numberWithDouble: positionX] forKey: @"positionX"];
	[pointObject setObject: [NSNumber numberWithDouble: positionY] forKey: @"positionY"];
	[pointObject setObject: [NSNumber numberWithDouble: positionZ] forKey: @"positionZ"];
}

@end
