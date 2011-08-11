//
//  FrictioinTests.h
//  imsimreal
//
//  Created by John Ahrens on 8/9/11.
//  Copyright 2011 John Ahrens, LLC. All rights reserved.
//

#ifndef FrictionTests_
#define FrictionTests_

#include <cppunit/extensions/HelperMacros.h>

namespace imsimreal 
{
    class FrictionTests: public CppUnit::TestFixture
    {
        CPPUNIT_TEST_SUITE(FrictionTests);
        CPPUNIT_TEST(testSingleParameterConstructor);
        CPPUNIT_TEST_SUITE_END();
        
    public:
        void testSingleParameterConstructor();
    };
};

#endif