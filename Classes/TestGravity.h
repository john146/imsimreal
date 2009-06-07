//
//  TestGravity.h
//  imSimReal
//
//  Created by John Ahrens on 6/6/09.
//  Copyright 2009 John Ahrens, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Test.h"

@interface TestGravity : NSObject <TestDelegate>
{
	NSString *testMethod;
	NSString *selectedBody;
	NSString *body;
	double	gravity;
	BOOL nilReturn;
}

@property (nonatomic, retain)NSString *testMethod;
@property (nonatomic, retain)NSString *selectedBody;
@property (nonatomic, retain)NSString *body;
@property (nonatomic, assign)double gravity;
@property (nonatomic, assign)BOOL nilReturn;

- (id)initWithTest: (NSDictionary *)test;

@end
