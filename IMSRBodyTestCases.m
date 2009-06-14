//
//  IMSRBodyTestCases.m
//  imSimReal
//
//  Created by John Ahrens on 6/13/09.
//  Copyright 2009 John Ahrens, LLC. All rights reserved.
//

#import "IMSRBodyTestCases.h"
#import "IMSRBody.h"

@implementation IMSRBodyTestCases

- (void)testInit
{
	IMSRBody *body = [[IMSRBody alloc] init];
	STAssertNil(body, @"Didn't return nil as required");
}

- (void)testInitWithNameGravity_WithNullName
{
	IMSRBody *body = [[IMSRBody alloc] initWithName: nil gravity: 0.0];
	STAssertNil(body, @"Didn't return nil as required");
}

- (void)testInitWithNameGravity_WithValidName
{
	NSString *name = @"Earth";
	double gravity = -9.81;
	IMSRBody *body = [[IMSRBody alloc] initWithName: name gravity: gravity];
	STAssertNotNil(body, @"Returned nil unexpectedly");
	STAssertEqualStrings(name, body.bodyName, @"Name is %@, but should be %@",
						 body.bodyName, name);
	STAssertEqualsWithAccuracy(body.bodyGravity, gravity, 0.00001, 
							   @"Gravity is %d, but should be %d", 
							   body.bodyGravity, gravity);
}

@end
