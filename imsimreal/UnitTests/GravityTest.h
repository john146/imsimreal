//
//  TestGravity.h
//  imsimreal
//
//  Created by John Ahrens on 8/2/11.
//  Copyright 2011 John Ahrens, LLC. All rights reserved.
//

#ifndef GravityTest_
#define GravityTest_

#include <cppunit/extensions/HelperMacros.h>

namespace imsimreal
{
    class Gravity;
    
    class GravityTest: public CppUnit::TestFixture
    {
        CPPUNIT_TEST_SUITE(GravityTest);
        CPPUNIT_TEST(testDefaultConstructor);
        CPPUNIT_TEST(testCopyConstructor);
        CPPUNIT_TEST(testAssignmentOperator);
        CPPUNIT_TEST(testSingleParameterConstructor);
        CPPUNIT_TEST(testSingleBodyConstructor);
        CPPUNIT_TEST(testSingleBodyConstructorChangingRadius);
        CPPUNIT_TEST(testTwoBodyConstructor);
        CPPUNIT_TEST_SUITE_END();
        
    public:
        void setUp();
        void tearDown();
        
        void testDefaultConstructor();
        void testCopyConstructor();
        void testAssignmentOperator();
        void testSingleParameterConstructor();
        void testSingleBodyConstructor();
        void testSingleBodyConstructorChangingRadius();
        void testTwoBodyConstructor();
        
    private:
        Gravity *myGravity;
    };
}

#endif