//
//  TestPointObject.h
//  imSimReal
//
//  Created by John Ahrens on 6/7/09.
//  Copyright 2009 John Ahrens, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Test.h"

@interface TestPointObject : NSObject <TestDelegate>
{
	NSString *testClass;
	NSString *testMethod;
	double inputPositionX;
	double inputPositionY;
	double inputPositionZ;
	double inputVelocityX;
	double inputVelocityY;
	double inputVelocityZ;
	double inputAccelerationX;
	double inputAccelerationY;
	double inputAccelerationZ;
	NSTimeInterval deltaTime;
	double resultPositionX;
	double resultPositionY;
	double resultPositionZ;
	double resultVelocityX;
	double resultVelocityY;
	double resultVelocityZ;
	double resultAccelerationX;
	double resultAccelerationY;
	double resultAccelerationZ;
	BOOL nilReturn;
}

@property (nonatomic, retain)NSString *testClass;
@property (nonatomic, retain)NSString *testMethod;
@property (nonatomic, assign)double inputPositionX;
@property (nonatomic, assign)double inputPositionY;
@property (nonatomic, assign)double inputPositionZ;
@property (nonatomic, assign)double inputVelocityX;
@property (nonatomic, assign)double inputVelocityY;
@property (nonatomic, assign)double inputVelocityZ;
@property (nonatomic, assign)double inputAccelerationX;
@property (nonatomic, assign)double inputAccelerationY;
@property (nonatomic, assign)double inputAccelerationZ;
@property (nonatomic, assign)NSTimeInterval deltaTime;
@property (nonatomic, assign)double resultPositionX;
@property (nonatomic, assign)double resultPositionY;
@property (nonatomic, assign)double resultPositionZ;
@property (nonatomic, assign)double resultVelocityX;
@property (nonatomic, assign)double resultVelocityY;
@property (nonatomic, assign)double resultVelocityZ;
@property (nonatomic, assign)double resultAccelerationX;
@property (nonatomic, assign)double resultAccelerationY;
@property (nonatomic, assign)double resultAccelerationZ;
@property (nonatomic, assign)BOOL nilReturn;

- (id)initWithTest: (NSDictionary *)test;

@end
