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
	double	gravity;
}

@property (nonatomic, assign)NSString *testMethod;
@property (nonatomic, assign)NSString *selectedBody;
@property (nonatomic, assign)double gravity;

- (id)initWithTest: (NSDictionary *)test;

@end
