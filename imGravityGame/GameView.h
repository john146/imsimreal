//
//  GameView.h
//  imGravityGame
//
//  Created by John Ahrens on 6/12/09.
//  Copyright 2009 John Ahrens, LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol GameViewDelegate;

@interface GameView : NSView 
{
	double timeNow;
	CGRect boxRect;
	CGRect ballRect;
	NSBezierPath *box;
	NSBezierPath *ball;
	
	id<GameViewDelegate>delegate;
}

@property (nonatomic, assign)id delegate;

- (void)updateBallPosition: (CGPoint)ballPosition
			   boxPosition: (CGPoint)boxPosition;

@end

@protocol GameViewDelegate<NSObject>

- (NSBezierPath *)gameView: (GameView *)gameView
	  updateBoxAtDeltaTime: (NSTimeInterval)deltaTime;

- (NSBezierPath *)gameView: (GameView *)gameView
	 updateBallAtDeltaTime: (NSTimeInterval)deltaTime;

@end
