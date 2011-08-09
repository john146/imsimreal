//
//  FrictionTests.cpp
//  imsimreal
//
//  Created by John Ahrens on 8/9/11
//  Copyright 2011 John Ahrens, LLC. All rights reserved.
//

#include <cppunit/TestAssert.h>

#include "FrictionTests.h"
#include "imsimreal.h"

CPPUNIT_TEST_SUITE_REGISTRATION(imsimreal::FrictionTests);

void imsimreal :: FrictionTests :: testDefaultConstructor()
{
    Friction *friction(new Friction());
    CPPUNIT_ASSERT(!friction);
}