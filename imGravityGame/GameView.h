//
//  GameView.h
//  imGravityGame
//
//  Created by John Ahrens on 6/12/09.
//  Copyright 2009 John Ahrens, LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface GameView : NSView 
{
	BOOL isPlaying;
	BOOL isDropping;
	
	double timeNow;
	NSBezierPath *box;
	NSBezierPath *ball;
}

@property (readwrite)BOOL isPlaying;
@property (readwrite)BOOL isDropping;

- (void)playGame;

@end
