//
//  Gravity.cpp
//  imsimreal
//
//  Created by John Ahrens on 8/2/11.
//  Copyright 2011 John Ahrens, LLC. All rights reserved.
//

#include <string>

#include "Gravity.h"

imsimreal :: Gravity :: Gravity(): gravity(EARTH)
{
}

imsimreal :: Gravity :: Gravity(double g): gravity(g)
{
    
}