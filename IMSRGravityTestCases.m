//
//  IMSRGravityTestCases.m
//  imSimReal
//
//  Created by John Ahrens on 12/21/08.
//  Copyright 2008 John Ahrens, LLC. All rights reserved.
//

#import "IMSRGravityTestCases.h"
#import "IMSRGravity.h"

@implementation IMSRGravityTestCases

- (void)testCreateIMSRGravity
{
	IMSRGravity *gravity	= [[IMSRGravity alloc] init];
	
	STAssertNotNil(gravity, @"IMSRGravity not created");
	STAssertNotNil(gravity.bodyGravity, @"Gravity NSDictionary not available");
	STAssertTrue(gravity.bodyGravity.count == 3, @"Incorrect number of elements in bodyGravity");
	
	NSNumber *result			= [gravity.bodyGravity valueForKey: @"Earth"];
	NSNumber *expectedResultE	= [NSNumber numberWithDouble: -9.81];
	STAssertTrue([result isEqualToNumber: expectedResultE], @"Incorrect gravity value for Earth: %@", result);
	
	result						= [gravity.bodyGravity valueForKey: @"Moon"];
	NSNumber *expectedResultM	= [NSNumber numberWithDouble: -1.624];
	STAssertTrue([result isEqualToNumber: expectedResultM], @"Incorrect gravity value for Moon: %@", result);
	
	result						= [gravity.bodyGravity valueForKey: @"Jupiter"];
	NSNumber *expectedResultJ	= [NSNumber numberWithDouble: -24.8];
	STAssertTrue([result isEqualToNumber: expectedResultJ], @"Incorrect gravity value for Jupiter: %@", result);
	
	[gravity release];
}

@end
