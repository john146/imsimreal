//
//  Gravity.h
//  imsimreal
//
//  Created by John Ahrens on 8/2/11.
//  Copyright 2011 John Ahrens, LLC. All rights reserved.
//

#ifndef Gravity_
#define Gravity_

const double EARTH = -9.81;
const double MOON = -1.624;
const double JUPITER = 24.8;

namespace imsimreal
{
    class Gravity
    {
    public:
        Gravity();
        explicit Gravity(double g);
        
        const double getGravity() const {return gravity;}
        
    protected:
        
    private:
        // Not needed
        //Gravity(Gravity &);
        //Gravity &operator=(Gravity &);
        //~Gravity();

        double gravity;
    };
}
#endif