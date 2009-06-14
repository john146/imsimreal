//
//  GravityGame.h
//  imGravityGame
//
//  Created by John Ahrens on 6/12/09.
//  Copyright 2009 John Ahrens, LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class IMSRPointObject;
//@class IMSRGravity;

@interface GravityGame : NSObject 
{
	IBOutlet NSTextField *result;
	IBOutlet NSPopUpButton *planets;
	
	IMSRPointObject *box;
	IMSRPointObject *ball;
//	NSArray *bodies;
	NSDictionary *bodies;
}

@property (assign)IMSRPointObject *box;
@property (assign)IMSRPointObject *ball;
//@property (assign)NSArray *bodies;
@property (assign)NSDictionary *bodies;

- (IBAction)boxVelocity: (id)sender;
- (IBAction)gravity: (id)sender;
- (IBAction)buttonPressed: (id)sender;

@end
