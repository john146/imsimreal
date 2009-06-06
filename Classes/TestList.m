//
//  TestList.m
//  imSimReal
//
//  Created by John Ahrens on 6/5/09.
//  Copyright 2009 John Ahrens, LLC. All rights reserved.
//

#import "TestList.h"
#import "TestGravity.h"

@implementation TestList

@synthesize testArray;

- (id)initWithTest: (NSDictionary *)test
{
	if (self = [super init])
	{
		NSMutableArray *myTests = [[NSMutableArray alloc] init];
		NSString *testPath = [[NSBundle mainBundle] pathForResource: [test objectForKey: @"detailedAction"]
															ofType: @"plist"];
		NSArray *tests = [NSArray arrayWithContentsOfFile: testPath];
		NSEnumerator *enumerator = [tests objectEnumerator];
		NSMutableDictionary *testDictionary;
		while (testDictionary = [enumerator nextObject])
		{
			if ([test objectForKey: @"execute"])
			{
				// TODO: This is where we handle the execution type
				NSMutableArray *tests = [[NSMutableArray alloc] init];
				if ([[test objectForKey: @"class"] isEqualToString: @"Gravity"])
				{
					NSString *path = [[NSBundle mainBundle] pathForResource: @"Gravity"
																	 ofType: @"plist"];
					NSArray *array = [NSArray arrayWithContentsOfFile: path];
					NSEnumerator *enumerator = [array objectEnumerator];
					NSDictionary *testDictionary;
					while (testDictionary = [enumerator nextObject])
					{
						TestGravity *testGravity = [[TestGravity alloc] initWithTest: testDictionary];
						Test *test = [[Test alloc] initWithTest: testDictionary
													   delegate: testGravity];
						[tests addObject: test];
						[testGravity release];
						[test release];
					}
				}
				
				self.testArray = tests;
				[tests release];
			}
			else
			{
				// These are lists
				TestList *testList = [[TestList alloc] initWithTest: testDictionary];
				Test *myTest = [[Test alloc] initWithTest: testDictionary
												 delegate: testList];
				[myTests addObject: myTest];
				[myTest release];
				[testList release];
			}
		}
		
		self.testArray = myTests;
	}
	
	return self;
}

- (void)dealloc
{
	[testArray release];
	
	[super dealloc];
}

#pragma mark Test Delegate Method

-(void)executeTest: (Test *)test
{
	NSEnumerator *enumerator = [testArray objectEnumerator];
	Test *myTest;
	while (myTest = [enumerator nextObject])
	{
		[myTest runTest];
		if (test.testColor == [UIColor grayColor])
		{
			test.testColor = myTest.testColor;
		}
		else if (test.testColor == [UIColor redColor])
		{
			if (myTest.testColor != [UIColor redColor])
			{
				test.testColor = [UIColor yellowColor];
			}
		}
		else if (test.testColor == [UIColor greenColor])
		{
			if (myTest.testColor != [UIColor greenColor])
			{
				test.testColor = [UIColor yellowColor];
			}
		}
	}
}

@end
