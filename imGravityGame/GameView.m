//
//  GameView.m
//  imGravityGame
//
//  Created by John Ahrens on 6/12/09.
//  Copyright 2009 John Ahrens, LLC. All rights reserved.
//

#import "GameView.h"


@implementation GameView

@synthesize delegate;

const NSTimeInterval deltaTime = 0.05;
const double ballRadius = 20.0;
const double boxWidth = 40.0;
const double boxHeight = 15.0;

- (id)initWithFrame:(NSRect)frame 
{
    self = [super initWithFrame:frame];
    if (self) 
	{
        // Initialization code here.
		timeNow = 0.0;
		boxRect = CGRectMake(0.0, 0.0, boxWidth, boxHeight);
		ballRect = CGRectMake(450.0, 220.0, ballRadius, ballRadius);
		
		box = [NSBezierPath bezierPathWithRect: NSRectFromCGRect(boxRect)];
		ball = [NSBezierPath bezierPathWithOvalInRect: NSRectFromCGRect(ballRect)];
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

- (void)updateBallPosition: (CGPoint)ballPosition
			   boxPosition: (CGPoint)boxPosition
{
	CGPoint origin = boxRect.origin;
	origin.x = boxPosition.x;
	origin.y = boxPosition.y;
	ballRect.origin.x = ballPosition.x;
	ballRect.origin.y = ballPosition.y;
	box = [NSBezierPath bezierPathWithRect: NSRectFromCGRect(boxRect)];
	ball = [NSBezierPath bezierPathWithRect: NSRectFromCGRect(ballRect)];
}

@end
