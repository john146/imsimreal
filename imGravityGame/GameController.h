//
//  GameController.h
//  imGravityGame
//
//  Created by John Ahrens on 6/21/09.
//  Copyright 2009 John Ahrens, LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "GameView.h"

@class IMSRPointObject;
@class GravityGame;

@interface GameController : NSObject
			<GameViewDelegate>
{
	
}

- (id)initWithGravityGame: (GravityGame *)gravityGame;

@end
