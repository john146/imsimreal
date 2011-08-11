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

void imsimreal :: FrictionTests :: testSingleParameterConstructor()
{
    FrictionCoefficient &pair(*(new FrictionCoefficient(STEEL_STEEL)));
    std::auto_ptr<Friction>friction(new Friction(pair));
    CPPUNIT_ASSERT(friction.get());
    CPPUNIT_ASSERT_EQUAL(std::string("Steel"), friction->getFirstName());
    CPPUNIT_ASSERT_EQUAL(std::string("Steel"), friction->getSecondName());
    CPPUNIT_ASSERT_EQUAL(STEEL_STEEL_STATIC, friction->getStaticCoefficient());
    CPPUNIT_ASSERT_EQUAL(STEEL_STEEL_DYNAMIC, friction->getDynamicCoefficient());
}