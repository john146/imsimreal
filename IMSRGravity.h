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

- (id)initWithBody: (NSString *)body;

- (double)gravityForSelectedBody;

@end
