//
//  Gravity.h
//  imsimreal
//
//  Created by John Ahrens on 8/2/11.
//  Copyright 2011 John Ahrens, LLC. All rights reserved.
//

#ifndef Gravity_
#define Gravity_

#include "map"

const double EARTH = -9.81;
const double MOON = -1.624;
const double JUPITER = 24.8;

namespace imsimreal
{
    class Gravity
    {
    public:
        Gravity();
        //Gravity(Gravity &);
        //Gravity &operator=(Gravity &);
        
        double getGravity() {return gravity;}
        
    protected:
        
    private:
        double gravity;
    };
}
#endif