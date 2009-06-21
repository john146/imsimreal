//
//  GameController.m
//  imGravityGame
//
//  Created by John Ahrens on 6/21/09.
//  Copyright 2009 John Ahrens, LLC. All rights reserved.
//

#import "GameController.h"
#import "GravityGame.h"

@implementation GameController

- (id)initWithGravityGame: (GravityGame *)gravityGame
{
	return nil;
}

- (NSBezierPath *)gameView: (GameView *)gameView
	  updateBoxAtDeltaTime: (NSTimeInterval)deltaTime
{
	return [[NSBezierPath alloc] init];
}

- (NSBezierPath *)gameView: (GameView *)gameView
	 updateBallAtDeltaTime: (NSTimeInterval)deltaTime
{
	return [[NSBezierPath alloc] init];
}

@end
