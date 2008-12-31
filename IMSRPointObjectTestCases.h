//
//  IMSRPointObjectTestCases.h
//  imSimReal
//
//  Created by John Ahrens on 12/27/08.
//  Copyright 2008 John Ahrens, LLC. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@class IMSRPointObject;

@interface IMSRPointObjectTestCases : SenTestCase 
{
	IMSRPointObject	*pointObj;
}

@property (nonatomic, retain) IMSRPointObject *pointObj;

- (void)testInitPointObjectWithPositionVelocityAndAcceleration;
- (void)testInitPointObjectWithPositionAndVelocity;
- (void)testInitPointObjectWithPosition;
- (void)testInitPointObject;
- (void)testUpdatePosition;
- (void)testUpdateVelocity;

@end
