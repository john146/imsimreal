//
//  IMSRGravityTestCases.m
//  imSimReal
//
//  Created by John Ahrens on 12/21/08.
//  Copyright 2008, 2011 John Ahrens, LLC. All rights reserved.
//

#import "IMSRGravityTests.h"
#import "IMSRGravity.h"

@implementation IMSRGravityTests

- (void)testCreateIMSRGravity
{
	IMSRGravity *gravity	= [[IMSRGravity alloc] init];
	
	STAssertNotNil(gravity, @"IMSRGravity not created");
	STAssertNotNil(gravity.bodyGravity, @"Gravity NSDictionary not available");
	STAssertTrue(gravity.bodyGravity.count == 3, @"Incorrect number of elements in bodyGravity");
	
	NSNumber *result			= [gravity.bodyGravity valueForKey: @"Earth"];
	NSNumber *expectedResult	= [[NSNumber alloc] initWithDouble: -9.81];
	STAssertTrue([result isEqualToNumber: expectedResult], @"Incorrect gravity value for Earth: %@", result);
	
	[gravity release];
	[expectedResult release];
}

@end
