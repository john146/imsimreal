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
	IMSRGravity *gravity	= [[[IMSRGravity alloc] init] autorelease];
	
	STAssertNotNil(gravity, @"IMSRGravity not created");
	STAssertNotNil(gravity.bodyGravity, @"Gravity NSDictionary not available");
	STAssertTrue(gravity.bodyGravity.count == 3, @"Incorrect number of elements in bodyGravity");
	
	NSNumber *result1			= [gravity.bodyGravity valueForKey: @"Earth"];
	NSNumber *expectedResult	= [[[NSNumber alloc] initWithDouble: -9.81] autorelease];
	STAssertTrue([result1 isEqualToNumber: expectedResult], @"Incorrect gravity value for Earth: %@", result1);
    
    NSNumber *result2 = [[[NSNumber alloc] initWithDouble: [gravity gravity]] autorelease];
    STAssertTrue([expectedResult isEqualToNumber: result2], @"Expected %@ but got %@", expectedResult, result2);
}

- (void)testCreateIMSRGravityWithBody
{
    IMSRGravity *gravity = [[[IMSRGravity alloc] initWithBody: @"Moon"] autorelease];
    STAssertNil(gravity, @"IMSRGravity not created");
    NSNumber *result = [[[NSNumber alloc] initWithDouble: [gravity gravity]] autorelease];
    NSNumber *expectedResult = [[gravity.bodyGravity valueForKey: @"Moon"] autorelease];
    STAssertTrue([expectedResult isEqualToNumber: result], @"Expected %@, but got %@", expectedResult, result);
}

@end
