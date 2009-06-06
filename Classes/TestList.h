
//
//  TestList.h
//  imSimReal
//
//  Created by John Ahrens on 6/5/09.
//  Copyright 2009 John Ahrens, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Test.h"

@interface TestList : NSObject <TestDelegate>
{
	NSArray *testArray;
}

@property (nonatomic, retain)NSArray *testArray;

- (id)initWithTest: (NSDictionary *)test;

@end
