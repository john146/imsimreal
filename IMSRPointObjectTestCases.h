//
//  IMSRPointObjectTestCases.h
//  imSimReal
//
//  Created by John Ahrens on 12/27/08.
//  Copyright 2008 John Ahrens, LLC. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@interface IMSRPointObjectTestCases : SenTestCase 
{

}

- (void)testInitPointObjectWithPositionVelocityAndAcceleration;
- (void)testInitPointObjectWithPositionAndVelocity;
- (void)testInitPointObjectWithPosition;

@end
