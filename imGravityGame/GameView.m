//
//  GameView.m
//  imGravityGame
//
//  Created by John Ahrens on 6/12/09.
//  Copyright 2009 John Ahrens, LLC. All rights reserved.
//

#import "GameView.h"


@implementation GameView

@synthesize isPlaying;
@synthesize isDropping;

const NSTimeInterval deltaTime = 0.05;

- (id)initWithFrame:(NSRect)frame 
{
    self = [super initWithFrame:frame];
    if (self) 
	{
        // Initialization code here.
		timeNow = 0.0;
		box = [NSBezierPath bezierPathWithRect: NSRectFromCGRect(CGRectMake(0.0, 0.0, 40.0, 15.0))];
		ball = [NSBezierPath bezierPathWithOvalInRect: NSRectFromCGRect(CGRectMake(450.0, 220.0, 20.0, 20.0))];
    }
	
    return self;
}

- (void)drawRect:(NSRect)rect 
{
    // Drawing code here.
	// Background
	NSRect bounds = [self bounds];
	[[NSColor grayColor] set];
	[NSBezierPath fillRect: bounds];
	
	// Box
	[[NSColor greenColor] set];
	[box fill];

	// ball
	[[NSColor redColor] set];
	[ball fill];
}

- (void)playGame
{
//	while (
}

@end
