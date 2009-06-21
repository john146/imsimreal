//
//  GravityGame.h
//  imGravityGame
//
//  Created by John Ahrens on 6/12/09.
//  Copyright 2009 John Ahrens, LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class IMSRPointObject;
@class GameView;

@interface GravityGame : NSObject 
{
	IBOutlet NSTextField *result;
	IBOutlet NSPopUpButton *planets;
	IBOutlet NSButton *start;
	IBOutlet NSButton *drop;
	IBOutlet NSButton *reset;
	IBOutlet GameView *playField;
	
//	IMSRPointObject *box;
//	IMSRPointObject *ball;
	NSDictionary *bodies;
	
	double boxVelocity;
	double ballAcceleration;
	BOOL isRunning;
	BOOL isDropping;
}

//@property (assign)IMSRPointObject *box;
//@property (assign)IMSRPointObject *ball;
@property (assign)NSDictionary *bodies;
@property (assign)NSButton *start;
@property (assign)NSButton *drop;
@property (assign)NSButton *reset;
@property (assign)GameView *playField;

@property (readonly)double boxVelocity;
@property (readonly)double ballAcceleration;

- (IBAction)boxVelocity: (id)sender;
- (IBAction)gravity: (id)sender;
- (IBAction)buttonPressed: (id)sender;

@end
