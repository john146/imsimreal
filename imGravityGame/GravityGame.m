//
//  GravityGame.m
//  imGravityGame
//
//  Created by John Ahrens on 6/12/09.
//  Copyright 2009 John Ahrens, LLC. All rights reserved.
//
#import <imSimReal/imSimReal.h>

#import "GravityGame.h"
#import "GameView.h"

@implementation GravityGame

@synthesize box;
@synthesize ball;
@synthesize bodies;
@synthesize start;
@synthesize drop;
@synthesize reset;
@synthesize playField;

- (void)initializeBall
{
	IMSRGravity *g = [[IMSRGravity alloc] initWithBody: [planets titleOfSelectedItem]];
	ball = [[IMSRPointObject alloc] init];
	ball.accelerationZ = g.selectedBody.bodyGravity;
}

- (void)initializeBox
{
	box = [[IMSRPointObject alloc] init];
	box.velocityX = [result doubleValue];
}

- (id)init
{
	if (self = [super init])
	{
		IMSRGravity *g = [[IMSRGravity alloc] init];
		self.bodies = g.bodyGravity;
		[self initializeBall];
		[self initializeBox];
	}
	
	return self;
}

- (IBAction)boxVelocity: (id)sender
{
	NSLog(@"Box velocity changed: %f", [sender doubleValue]);
	
	box.velocityX = [result doubleValue];
}

- (IBAction)gravity: (id)sender
{
	NSString *name = [sender titleOfSelectedItem];
	NSLog(@"Planet changed to %@", name);
	
	IMSRGravity *g = [[IMSRGravity alloc] initWithBody: name];
	ball.velocityZ = g.selectedBody.bodyGravity;
}

- (IBAction)buttonPressed: (id)sender
{
	NSLog(@"Button %@ pressed", [sender title]);
	
	if ([[sender title] isEqualToString: @"Start"])
	{
		[start setEnabled: NO];
		[reset setEnabled: YES];
		[drop setEnabled: YES];
	}
	else if ([[sender title] isEqualToString: @"Drop"])
	{
		[start setEnabled: NO];
		[drop setEnabled: NO];
	}
	else if ([[sender title] isEqualToString: @"Reset"])
	{
		[start setEnabled: YES];
		[drop setEnabled: NO];
		[reset setEnabled: NO];
	}
}

@end
