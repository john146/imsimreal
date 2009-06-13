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

- (id)init
{
	if (self = [super init])
	{
		IMSRGravity *g = [[IMSRGravity alloc] init];
		[planets addItemsWithTitles: [g.bodyGravity allKeys]];
		[planets selectItemWithTitle: g.selectedBody];
	}
	
	return self;
}

- (IBAction)boxVelocity: (id)sender
{
	
}

- (IBAction)gravity: (id)sender
{
	
}

- (IBAction)buttonPressed: (id)sender
{
	
}

@end
