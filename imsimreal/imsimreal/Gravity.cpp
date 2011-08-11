//
//  Gravity.cpp
//  imsimreal
//
//  Created by John Ahrens on 8/2/11.
//  Copyright 2011 John Ahrens, LLC. All rights reserved.
//

#include <string>

#include <math.h>

#include "Gravity.h"

//====================================================================================================================
imsimreal :: Gravity :: Gravity(): gravity(EARTH), mass(0.0), radius(0.0), isConstant(true)
{
}

//====================================================================================================================
imsimreal :: Gravity :: Gravity(double g): gravity(g), mass(0.0), radius(0.0), isConstant(true)
{
    
}

//====================================================================================================================
imsimreal :: Gravity :: Gravity(double mass, double radius): gravity(0.0), mass(mass), radius(radius), isConstant(false)
{
    
}

//====================================================================================================================
double imsimreal :: Gravity :: getGravity()
{
    if (!isConstant)
    {
        gravity = -(G * mass / pow(radius, 2.0));
    }
    
    return gravity;
}