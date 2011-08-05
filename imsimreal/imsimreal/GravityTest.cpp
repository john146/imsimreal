//
//  TestGravity.cpp
//  imsimreal
//
//  Created by John Ahrens on 8/2/11.
//  Copyright 2011 John Ahrens, LLC. All rights reserved.
//

#include </usr/local/include/cppunit/extensions/HelperMacros.h>
#include <cppunit/TestAssert.h>

#include "GravityTest.h"
#include "imsimreal.h"

CPPUNIT_TEST_SUITE_REGISTRATION(imsimreal::GravityTest);

void imsimreal :: GravityTest :: setUp()
{
    myGravity = new Gravity();
}

void imsimreal :: GravityTest :: tearDown()
{
    delete myGravity;
}

void imsimreal :: GravityTest :: testDefaultConstructor() 
{
    std::auto_ptr<Gravity>myGravity (new Gravity());
    CPPUNIT_ASSERT(myGravity.get());
    CPPUNIT_ASSERT_DOUBLES_EQUAL(EARTH, myGravity->getGravity(), 0.01);
}

void imsimreal :: GravityTest :: testCopyConstructor()
{

}