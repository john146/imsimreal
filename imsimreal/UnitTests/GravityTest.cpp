//
//  TestGravity.cpp
//  imsimreal
//
//  Created by John Ahrens on 8/2/11.
//  Copyright 2011 John Ahrens, LLC. All rights reserved.
//

//#include </usr/local/include/cppunit/extensions/HelperMacros.h>
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
    std::auto_ptr<Gravity>thisGravity(new Gravity());
    CPPUNIT_ASSERT(thisGravity.get());
    CPPUNIT_ASSERT_DOUBLES_EQUAL(EARTH, thisGravity->getGravity(), 0.01);
}

void imsimreal :: GravityTest :: testCopyConstructor()
{
    std::auto_ptr<Gravity>thisGravity(new Gravity(*myGravity));
    CPPUNIT_ASSERT(&thisGravity);
    CPPUNIT_ASSERT_DOUBLES_EQUAL(EARTH, thisGravity->getGravity(), 0.01);
}

void imsimreal :: GravityTest :: testAssignmentOperator()
{
    Gravity &thisGravity = *myGravity;
    CPPUNIT_ASSERT(&thisGravity);
    CPPUNIT_ASSERT_DOUBLES_EQUAL(EARTH, thisGravity.getGravity(), 0.01);
}

void imsimreal :: GravityTest :: testSingleParameterConstructor()
{
    std::auto_ptr<Gravity>thisGravity(new Gravity(MOON));
    CPPUNIT_ASSERT(thisGravity.get());
    CPPUNIT_ASSERT_DOUBLES_EQUAL(MOON, thisGravity->getGravity(), 0.01);
}

void imsimreal :: GravityTest :: testSingleBodyConstructor()
{
    double mass = 5.936e24; // kg mass of the earth
    double radius = 6356000; //6371000; // meters polar radius of the earth
    std::auto_ptr<Gravity>thisGravity(new Gravity(mass, radius));
    CPPUNIT_ASSERT(thisGravity.get());
    CPPUNIT_ASSERT_DOUBLES_EQUAL(EARTH, thisGravity->getGravity(), 0.01);
}

void imsimreal :: GravityTest :: testSingleBodyConstructorChangingRadius()
{
    double mass = 5.936e24;
    double radius = 6356000;
    std::auto_ptr<Gravity>thisGravity(new Gravity(mass, radius));
    CPPUNIT_ASSERT(thisGravity.get());
    CPPUNIT_ASSERT_DOUBLES_EQUAL(EARTH, thisGravity->getGravity(), 0.01);
    
    thisGravity->setRadius(6378100); // Equatorial radius of earth, meters
    CPPUNIT_ASSERT_DOUBLES_EQUAL(-9.74, thisGravity->getGravity(), 0.01);
}

void :: imsimreal :: GravityTest :: testTwoBodyConstructor()
{
    double mass1 = 7.3477e22; // mass of Moon, kg
    double mass2 = 5.936e24; // mass of Earth, kg
    double radius = 384405000; // distance from earth center of mass to moon center of mass, meters
    std::auto_ptr<Gravity>thisGravity(new Gravity(mass1, mass2, radius));
    CPPUNIT_ASSERT(thisGravity.get());
    CPPUNIT_ASSERT_DOUBLES_EQUAL(-1.97e20, thisGravity->getGravity(), 0.01e20);
}