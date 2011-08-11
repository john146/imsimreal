//
//  Friction.h
//  imsimreal
//
//  Created by John Ahrens on 8/9/11.
//  Copyright 2011 John Ahrens, LLC. All rights reserved.
//

#ifndef Friction_
#define Friction_

#include <string>

// Friction coefficients
const double STEEL_STEEL_STATIC = 0.7; 
const double STEEL_STEEL_DYNAMIC = 0.6;
const double STEEL_STEEL_LUB_STATIC = 0.12;
const double STEEL_STEEL_LUB_DYNAMIC = 0.07;
const double ALUMINUM_STEEL_STATIC = 0.61;
const double ALUMINUM_STEEL_DYNAMIC = 0.47;
const double COPPER_STEEL_STATIC = 0.53;
const double COPPER_STEEL_DYNAMIC = 0.36;
const double CAST_IRON_CAST_IRON_STATIC = 1.1;
const double CAST_IRON_CAST_IRON_DYNAMIC = 0.15;
const double TEFLON_TEFLON_STATIC = 0.04;
const double TEFLON_TEFLON_DYNAMIC = 0.04;
const double GLASS_GLASS_STATIC = 0.94;
const double GLASS_GLASS_DYNAMIC = 0.4;
const double WOOD_WOOD_STATIC = 0.25;
const double WOOD_WOOD_DYNAMIC = 0.2;
const double RUBBER_CONCRETE_STATIC = 1.0;
const double RUBBER_CONCRETE_DYNAMIC = 0.8;
const double RUBBER_CONCRETE_WET_STATIC = 0.7;
const double RUBBER_CONCRETE_WET_DYNAMIC = 0.5;
const double ICE_ICE_STATIC = 0.1;
const double ICE_ICE_DYNAMIC = 0.03;
const double WAXED_SKI_SNOW_STATIC = 0.1;
const double WAXED_SKI_SNOW_DYNAMIC = 0.05;

namespace imsimreal
{
    enum coefficient
    {
        STEEL_STEEL,
        STEEL_STEEL_LUB,
        ALUMINUM_STEEL,
        COPPER_STEEL,
        CAST_IRON_CAST_IRON,
        TEFLON_TEFLON,
        GLASS_GLASS,
        WOOD_WOOD,
        RUBBER_CONCRETE,
        RUBBER_CONCRETE_WET,
        ICE_ICE,
        WAXED_SKI_SNOW
    };
    
    class FrictionCoefficient
    {
    public:
        FrictionCoefficient(coefficient value);
        
        std::string &getFirstName() {return firstName;}
        std::string &getSecondName() {return secondName;}
        double getStaticCoefficient() {return staticCoefficient;}
        double getDynamicCoefficient() {return dynamicCoefficient;}
        
    protected:
        
    private:
        // Not used
        FrictionCoefficient();
        FrictionCoefficient(FrictionCoefficient &);
        FrictionCoefficient &operator=(FrictionCoefficient &);
        
        std::string &firstName;
        std::string &secondName;
        double staticCoefficient;
        double dynamicCoefficient;
    };
    
    class Friction
    {
    public:
        Friction(FrictionCoefficient &pair);
        
        std::string &getFirstName();
        std::string &getSecondName();
        double getStaticCoefficient();
        double getDynamicCoefficient();
        
    protected:
        
    private:
        // Not used
        Friction();
        Friction(Friction &);
        Friction &operator=(Friction &);
        
        FrictionCoefficient &coefficient;
    };
}

#endif