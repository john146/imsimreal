//
//  IMSRBody.h
//  imSimReal
//
//  Created by John Ahrens on 6/13/09.
//  Copyright 2009 John Ahrens, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * IMSRBody is strictly a model class, containing the data structure of the 
 * Body, meaning the name of the body and it's gravitational attraction.
 * Since null values make no sense, the -init method is overridden to return nil.
 */

@interface IMSRBody : NSObject
{
	NSString *bodyName;
	double bodyGravity;
}

/// The name of the body 
@property (nonatomic, assign)NSString *bodyName;

/// The gravitational attraction of the body
@property (assign)double bodyGravity;


/**
 * Initializes a new object. Note that if name is nil, the initializer returns nil.
 *
 * @param name Name of the body, assigned to the bodyName property
 * @param gravity Gravitational attraction of the body, assigned to bodyGravity
 *
 * @returns the initialized self, or nil if name is nil.
 */
- (id)initWithName: (NSString *)name gravity: (double)gravity;

@end
