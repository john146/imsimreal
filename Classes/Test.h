//
//  Test.h
//  imSimReal
//
//  Created by John Ahrens on 6/6/09.
//  Copyright 2009 John Ahrens, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TestDelegate;

@interface Test : NSObject 
{
	NSString *testName;
	UIColor *testColor;
	NSString *testDetails;
	id<TestDelegate>delegate;
}

@property (nonatomic, retain)NSString *testName;
@property (nonatomic, retain)UIColor *testColor;
@property (nonatomic, retain)NSString *testDetails;
@property (nonatomic, assign)id	delegate;

- (id)initWithTest: (NSDictionary *)test
		  delegate: (id)theDelegate;

- (void)runTest;

@end

@protocol TestDelegate<NSObject>

- (void)executeTest: (Test *)test;

@end

