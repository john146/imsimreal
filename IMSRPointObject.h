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
	double positionX;
	double positionY;
	double positionZ;
	double velocityX;
	double velocityY;
	double velocityZ;
	double accelerationX;
	double accelerationY;
	double accelerationZ;
}

/// The X position in meters
@property (nonatomic, assign)double positionX;

/// The Y position in meters
@property (nonatomic, assign)double positionY;

/// The Z (vertical) position in meters
@property (nonatomic, assign)double positionZ;

/// Velocity along the X coordinate in meters/second
@property (nonatomic, assign)double velocityX;

/// Velocity along the Y coordinate in meters/second
@property (nonatomic, assign)double velocityY;

/// Velocity along the Z (vertical) coordinate in meters/second
@property (nonatomic, assign)double velocityZ;

/// Acceleration along the X coordinate in meters/second<sup>2</sup>
@property (nonatomic, assign)double accelerationX;

/// Acceleration along the Y coordinate in meters/second<sup>2</sup>
@property (nonatomic, assign)double accelerationY;

/// Acceleration along the Z (vertical) coordinate in meters/second<sup>2</sup>
@property (nonatomic, assign)double accelerationZ;

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
- (id)initWithPositionX: (double)myPositionX		
			  positionY: (double)myPositionY		 
			  positionZ: (double)myPositionZ		
			  velocityX: (double)myVelocityX		
			  velocityY: (double)myVelocityY		
			  velocityZ: (double)myVelocityZ		 
		  accelerationX: (double)myAccelerationX	
		  accelerationY: (double)myAccelerationY	  
		  accelerationZ: (double)myAccelerationZ;	 

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
- (id)initWithPositionX: (double)myPositionX
			  positionY: (double)myPositionY 
			  positionZ: (double)myPositionZ 
			  velocityX: (double)myVelocityX 
			  velocityY: (double)myVelocityY 
			  velocityZ: (double)myVelocityZ; 

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
- (id)initWithPositionX: (double)myPositionX	
			  positionY: (double)myPositionY	 
			  positionZ: (double)myPositionZ;	 

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
