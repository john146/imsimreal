//
//  IMSRPointObjectTestCases.h
//  imSimReal
//
//  Created by John Ahrens on 12/27/08.
//  Copyright 2008 John Ahrens, LLC. All rights reserved.
//

#import "GTMSenTestCase.h"

@class IMSRPointObject;

@interface IMSRPointObjectTestCases : GTMTestCase 
{
	IMSRPointObject	*pointObj;
}

@property (nonatomic, retain) IMSRPointObject *pointObj;

@end
