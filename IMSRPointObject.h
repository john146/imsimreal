//
//  IMSRPointObject.h
//  imSimReal
//
//  Created by John Ahrens on 12/27/08.
//  Copyright 2008 John Ahrens, LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface IMSRPointObject : NSObject 
{
	NSMutableDictionary	*pointObject;
}

@property (nonatomic, retain) NSMutableDictionary *pointObject;

- (id)initWithPositionX: (double)positionX 
			  positionY: (double)positionY 
			  positionZ: (double)positionZ
			  velocityX: (double)velocityX 
			  velocityY: (double)velocityY 
			  velocityZ: (double)velocityZ
		  accelerationX: (double)accelerationX 
		  accelerationY: (double)accelerationY 
		  accelerationZ: (double)accelerationZ;

- (id)initWithPositionX: (double)positionX 
			  positionY: (double)positionY 
			  positionZ: (double)positionZ
			  velocityX: (double)velocityX 
			  velocityY: (double)velocityY 
			  velocityZ: (double)velocityZ;

- (id)initWithPositionX: (double)positionX 
			  positionY: (double)positionY 
			  positionZ: (double)positionZ;

- (double)positionX;
- (double)positionY;
- (double)positionZ;
- (double)velocityX;
- (double)velocityY;
- (double)velocityZ;
- (double)accelerationX;
- (double)accelerationY;
- (double)accelerationZ;

- (void)updatePositionX: (double)positionX 
			  positionY: (double)positionY 
			  positionZ: (double)positionZ;

- (void)updateVelocityX: (double)velocityX
			  velocityY: (double)velocityY
			  velocityZ: (double)velocityZ;

- (void)updateAccelerationX: (double)accelerationX
			  accelerationY: (double)accelerationY
			  accelerationZ: (double)accelerationZ;

- (void)computeStateForDeltaTime: (NSTimeInterval)deltaTime;

@end
