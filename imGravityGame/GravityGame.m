//
//  GravityGame.m
//  imGravityGame
//
//  Created by John Ahrens on 6/12/09.
//  Copyright 2009 John Ahrens, LLC. All rights reserved.
//
#import <imSimReal/imSimReal.h>

#import "GravityGame.h"

@implementation GravityGame

@synthesize box;
@synthesize ball;
@synthesize bodies;

- (id)init
{
	if (self = [super init])
	{
		IMSRGravity *g = [[IMSRGravity alloc] init];
/*		NSMutableArray *bodyArray = [[NSMutableArray alloc] init];
		for (id key in g.bodyGravity)
		{
			IMSRBody *body = [[IMSRBody alloc] initWithName: key 
													gravity: [[g.bodyGravity objectForKey: key] doubleValue]];
			[bodyArray addObject: body];
		}
		
		self.bodies = bodyArray;*/
		self.bodies = g.bodyGravity;
	}
	
	return self;
}

- (IBAction)boxVelocity: (id)sender
{
	NSLog(@"Box velocity changed: %f", [sender doubleValue]);
}

- (IBAction)gravity: (id)sender
{
	NSLog(@"Planet changed to %@", [sender titleOfSelectedItem]);
}

- (IBAction)buttonPressed: (id)sender
{
	NSLog(@"Button %@ pressed", [sender title]);
}

@end
