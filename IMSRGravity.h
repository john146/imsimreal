//
//  IMSRGravity.h
//  imSimReal
//
//  Created by John Ahrens on 12/21/08.
//  Copyright 2008, 2011 John Ahrens, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

struct IMSRGravityImpl;

@interface IMSRGravity : NSObject 
{
	NSDictionary *bodyGravity;
    
@private
    struct IMSRGravityImpl *gravity;
}

@property (nonatomic, retain)NSDictionary *bodyGravity;

@end
