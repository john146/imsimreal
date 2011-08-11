//
//  Gravity.h
//  imsimreal
//
//  Created by John Ahrens on 8/2/11.
//  Copyright 2011 John Ahrens, LLC. All rights reserved.
//

/**
 * Gravity is a force that acts between two masses. Here we treat gravity as an acceleration (meters/sec^2), which is the 
 * normal means of defining gravitational attraction. 
 *
 *In general, we can define gravity as:
 *  a = Gm1m2/r^2 where
 *      a = acceleration in meters/sec^2
 *      G = gravitational constant, 6.674e-11 N-m^2/kg^2
 *      m1, m2 = mass of the bodies 1 and 2, respectively, in kilograms
 *      r = radius between the center of mass of the bodies 1 and 2 in meters
 *
 * In cases where the mass of m1 is insignificant with respect to the mass of m2, such as a planet or moon and almost 
 * any conceivable artificial object, we can simplify the equation by ignoring m1 as follows:
 * a = Gm2/r^2  
 * In cases where we are dealing with objects close to the surface of a planet or moon, we can treat gravity as a 
 * constant for all practical purposes.
 */

#ifndef Gravity_
#define Gravity_

const double EARTH = -9.81;
const double MOON = -1.624;
const double JUPITER = 24.8;

const double G = 6.674e-11; // Gravitational constant N-m^2/kg^2

namespace imsimreal
{
    class Gravity
    {
    public:
        /**
         * The default constructor assumes Earth surface setting that as the gravitational acceleration.
         */
        Gravity();
        
        /**
         * Set the graviational acceleration to the value supplied to the single parameter constructor
         * 
         * @param g Gravitational acceleration in meters/sec^2.
         */
        explicit Gravity(double g);
        
        /**
         * Sets mass and radius to use in computing acceleration. Mass is constant in this model, but radius
         * can change.
         *
         * @param mass The mass of the most massive object, in Kilograms
         * @param radius The distance between the center of mass of the two bodies in question, in meters.
         */
        Gravity(double mass, double radius);
        
        /**
         * @return the value of gravitational acceleration in meters/sec^2.
         */
        double getGravity();
        
        /**
         * @param radius New distance between the two bodies, in meters
         */
        void setRadius(double r) {radius = r;}
        
    protected:
        
    private:
        // Not needed
        //Gravity(Gravity &);
        //Gravity &operator=(Gravity &);
        //~Gravity();

        double gravity; // in meters/sec^2
        double mass; // in kilograms
        double radius; // in meters
        bool isConstant; // true if using constant for gravity, false if computing gravity
    };
}
#endif