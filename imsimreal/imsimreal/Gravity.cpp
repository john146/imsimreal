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
imsimreal :: Gravity :: Gravity(): gravity(EARTH), mass1(0.0), mass2(0.0), radius(0.0), isConstant(true)
{
}

//====================================================================================================================
imsimreal :: Gravity :: Gravity(double g): gravity(g), mass1(0.0), mass2(0.0), radius(0.0), isConstant(true)
{
    
}

//====================================================================================================================
imsimreal :: Gravity :: Gravity(double mass, double radius): 
gravity(0.0), mass1(0.0), mass2(mass), radius(radius), isConstant(false)
{
    
}

//====================================================================================================================
imsimreal :: Gravity :: Gravity(double mass1, double mass2, double radius): 
gravity(0.0), mass1(mass1), mass2(mass2), radius(radius), isConstant(false)
{

}

//====================================================================================================================
double imsimreal :: Gravity :: getGravity()
{
    if (!isConstant)
    {
        if (0.0 == mass1)
        {
            gravity = -(G * mass2 / pow(radius, 2.0));
        }
        else
        {
            gravity = -(G * mass1 * mass2 / pow(radius, 2.0));
        }
    }
    
    return gravity;
}