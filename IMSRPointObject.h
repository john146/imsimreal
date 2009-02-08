//
//  IMSRPointObject.h
//  imSimReal
//
//  Created by John Ahrens on 12/27/08.
//  Copyright 2008 John Ahrens, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * IMSPointObject represents a point mass in a cartesian coordinate system. It 
 * has a state, consisting of a position, velocity and acceleration.
 *
 * Units are:
 * Position: meters
 * Velocity: meters/second
 * Acceleration: meters/second<sup>2</sup>
 */

@interface IMSRPointObject : NSObject 
{
	NSMutableDictionary	*pointObject;
}

@property (nonatomic, retain) NSMutableDictionary *pointObject;

/**
 * Initializer allowing the user to set all values for initial state of the object
 *
 * @param positionX The X coordinate of the point, in meters
 * @param positionY The Y coordinate of the point, in meters
 * @param positionZ The Z coordinate of the point, in meters
 * @param velocityX The velocity along the X coordinate, in meters/second
 * @param velocityY The velocity along the Y coordinate, in meters/second
 * @param velocityZ The velocity along the Z coordinate, in meters/second
 * @param accelerationX The acceleration along the X coordinate, in meters/second<sup>2</sup>
 * @param accelerationY The acceleration along the Y coordinate, in meters/second<sup>2</sup>
 * @param accelerationZ The acceleration along the Z coordinate, in meters/second<sup>2</sup>
 *
 * @return self
 */
- (id)initWithPositionX: (double)positionX		
			  positionY: (double)positionY		 
			  positionZ: (double)positionZ		
			  velocityX: (double)velocityX		
			  velocityY: (double)velocityY		
			  velocityZ: (double)velocityZ		 
		  accelerationX: (double)accelerationX	
		  accelerationY: (double)accelerationY	  
		  accelerationZ: (double)accelerationZ;	 

/**
 * Initializer allowing the user to set all values for initial position and velocity. 
 * Initial acceleration is set to 0.0.
 *
 * @param positionX The X coordinate of the point, in meters
 * @param positionY The Y coordinate of the point, in meters
 * @param positionZ The Z coordinate of the point, in meters
 * @param velocityX The velocity along the X coordinate, in meters/second
 * @param velocityY The velocity along the Y coordinate, in meters/second
 * @param velocityZ The velocity along the Z coordinate, in meters/second
 
 * @return self
 */
- (id)initWithPositionX: (double)positionX
			  positionY: (double)positionY 
			  positionZ: (double)positionZ 
			  velocityX: (double)velocityX 
			  velocityY: (double)velocityY 
			  velocityZ: (double)velocityZ; 

/**
 * Initializer allowing the user to set values for the initial position. The 
 * initial velocity and acceleration are set to 0.0.
 *
 * @param positionX The X coordinate of the point, in meters
 * @param positionY The Y coordinate of the point, in meters
 * @param positionZ The Z coordinate of the point, in meters
 *
 * @return self
 */
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

/**
 * Update the point's position in the coordinate system. Normally the position
 * will get updated by computeStateForDeltaTime: but there may be times when this 
 * method is needed.
 * 
 * @see computeStateForDeltaTime:
 * 
 * @param positionX The new X coordinate, in meters.
 * @param positionY The new Y coordinate, in meters.
 * @param positionZ The new Z coordinate, in meters.
 */
- (void)updatePositionX: (double)positionX 
			  positionY: (double)positionY 
			  positionZ: (double)positionZ;

/**
 * Update the point's velocity in the coordinate system. Normally the velocity
 * will get updated by computeStateForDeltaTime: but there may be times when this
 * method is needed.
 *
 * @see computeStateForDeltaTime:
 *
 * @param velocityX The new velocity along the X coordinate, in meters/second.
 * @param velocityY The new velocity along the Y coordinate, in meters/second.
 * @param velocityZ The new velocithy along the Z coordinate, in meters/second.
 */
- (void)updateVelocityX: (double)velocityX
			  velocityY: (double)velocityY
			  velocityZ: (double)velocityZ;

/**
 * Update the acceleration in the coordinate system. Acceleration does not get 
 * updated by computeStateForDeltatime: so this is the only way that acceleration
 * changes.
 *
 * @see computeStateForDeltaTime:
 *
 * @param accelerationX The acceleration along the X coordinate, in meters/second<sup>2</sup>
 * @param accelerationY The acceleration along the Y coordinate, in meters/second<sup>2</sup>
 * @param accelerationZ The acceleration along the Z coordinate, in meters/second<sup>2</sup>
 */
- (void)updateAccelerationX: (double)accelerationX
			  accelerationY: (double)accelerationY
			  accelerationZ: (double)accelerationZ;

/**
 * Comutes a new state for the point deltaTime into the future.  Updates position
 * with the equation:
 * newPosition = currentPosition + currentVelocity * deltaTime + currentAcceleration * deltaTime<sup>2</sup> / 2
 * and velocity becomes:
 * newVelocity = currentVelocity + currentAcceleration * deltaTime
 *
 * @param deltaTime An NSTimeInterval value to look into the future. The smaller
 * the interval the more accurate the computation, but the more computing power required.
 */
- (void)computeStateForDeltaTime: (NSTimeInterval)deltaTime;

@end
