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

- (id)initWithPositionX: (double)positionX positionY: (double)positionY positionZ: (double)positionZ;

@end
