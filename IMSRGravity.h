//
//  IMSRGravity.h
//  imSimReal
//
//  Created by John Ahrens on 12/21/08.
//  Copyright 2008 John Ahrens, LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/**
 * IMSRGravity is a wrapper class for an NSDictionary, which contains the 
 * gravitational attraction at the surface of several celestial bodies, such as 
 * Earth, Moon and Jupiter. The NSDictionary is initialized from a property 
 * list (Gravity.plist).
 *
 * Gravity is always negative. The units are meters/sec<sup>2</sup>.
 */

@interface IMSRGravity : NSObject 
{
	NSDictionary	*bodyGravity;
	NSString		*selectedBody;
}

@property (nonatomic, retain)NSDictionary	*bodyGravity;
@property (nonatomic, retain)NSString		*selectedBody;

/**
 * An initializer for selecting the body to use when initializing. If no body is 
 * selected, the default init: method sets body to Earth
 *
 * @param body	The body to set selectedBody to
 *
 * @return a newly initialized IMSRGravity object
 */
- (id)initWithBody: (NSString *)body;

/**
 * Get the gravity value for the selectedBody.
 *
 * @return gravity for the selectedBody variable, in meters/second.
 */
- (double)gravityForSelectedBody;

@end
