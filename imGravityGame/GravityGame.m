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
		NSMutableArray *bodyArray = [[NSMutableArray alloc] init];
		for (id key in g.bodyGravity)
		{
			NSString *name = key;
			double gAccel = [[g.bodyGravity objectForKey: key] doubleValue];
			IMSRBody *body = [[IMSRBody alloc] initWithName: name 
													gravity: gAccel];
			[bodyArray addObject: body];
		}
		
		self.bodies = bodyArray;
//		[planets addItemsWithTitles: [g.bodyGravity allKeys]];
//		[planets selectItemWithTitle: g.selectedBody];
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
