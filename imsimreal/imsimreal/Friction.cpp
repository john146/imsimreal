//
//  Friction.cpp
//  imsimreal
//
//  Created by John Ahrens on 8/9/11.
//  Copyright 2011 John Ahrens, LLC. All rights reserved.
//

#include <iostream>

#include "Friction.h"

imsimreal :: FrictionCoefficient :: FrictionCoefficient(coefficient value): 
                firstName(*(new std::string())), 
                secondName(*(new std::string())), 
                staticCoefficient(0.0), 
                dynamicCoefficient(0.0)
{
    switch (value)
    {
        case STEEL_STEEL:
            firstName = "Steel";
            secondName = "Steel";
            staticCoefficient = STEEL_STEEL_STATIC;
            dynamicCoefficient = STEEL_STEEL_DYNAMIC;
            break;
            
        case STEEL_STEEL_LUB:
            firstName = "Steel";
            secondName = "Steel";
            staticCoefficient = STEEL_STEEL_LUB_STATIC;
            dynamicCoefficient = STEEL_STEEL_LUB_DYNAMIC;
            break;
            
        case ALUMINUM_STEEL:
            firstName = "Aluminum";
            secondName = "Steel";
            staticCoefficient = ALUMINUM_STEEL_STATIC;
            dynamicCoefficient = ALUMINUM_STEEL_DYNAMIC;
            break;
            
        case COPPER_STEEL:
            firstName = "Copper";
            secondName = "Steel";
            staticCoefficient = COPPER_STEEL_STATIC;
            dynamicCoefficient = COPPER_STEEL_DYNAMIC;
            break;
            
        case CAST_IRON_CAST_IRON:
            firstName = "Cast Iron";
            secondName = "Cast Iron";
            staticCoefficient = CAST_IRON_CAST_IRON_STATIC;
            dynamicCoefficient = CAST_IRON_CAST_IRON_DYNAMIC;
            break;
            
        case TEFLON_TEFLON:
            firstName = "Teflon";
            secondName = "Teflon";
            staticCoefficient = TEFLON_TEFLON_STATIC;
            dynamicCoefficient = TEFLON_TEFLON_DYNAMIC;
            break;
            
        case GLASS_GLASS:
            firstName = "Glass";
            secondName = "Glass";
            staticCoefficient = GLASS_GLASS_STATIC;
            dynamicCoefficient = GLASS_GLASS_DYNAMIC;
            break;
            
        case WOOD_WOOD:
            firstName = "Wood";
            secondName = "Wood";
            staticCoefficient = WOOD_WOOD_STATIC;
            dynamicCoefficient = WOOD_WOOD_DYNAMIC;
            break;
            
        case RUBBER_CONCRETE:
            firstName = "Rubber";
            secondName = "Concrete";
            staticCoefficient = RUBBER_CONCRETE_STATIC;
            dynamicCoefficient = RUBBER_CONCRETE_DYNAMIC;
            break;
            
        case RUBBER_CONCRETE_WET:
            firstName = "Rubber";
            secondName = "Concrete";
            staticCoefficient = RUBBER_CONCRETE_WET_STATIC;
            dynamicCoefficient = RUBBER_CONCRETE_WET_DYNAMIC;
            break;
            
        case ICE_ICE:
            firstName = "Ice";
            secondName = "Ice";
            staticCoefficient = ICE_ICE_STATIC;
            dynamicCoefficient = ICE_ICE_DYNAMIC;
            break;
            
        case WAXED_SKI_SNOW:
            firstName = "Waxed Ski";
            secondName = "Snow";
            staticCoefficient = WAXED_SKI_SNOW_STATIC;
            dynamicCoefficient = WAXED_SKI_SNOW_DYNAMIC;
            break;
            
        default:
            std::cout << "Don't know what this value is" << std::endl;
            break;
    }
}

imsimreal :: Friction :: Friction(FrictionCoefficient &coef): coefficient(coef)
{
    
}

std::string &imsimreal :: Friction :: getFirstName()
{
    return coefficient.getFirstName();
}

std::string &imsimreal :: Friction :: getSecondName()
{
    return coefficient.getSecondName();
}

double imsimreal :: Friction :: getStaticCoefficient()
{
    return coefficient.getStaticCoefficient();
}

double imsimreal :: Friction :: getDynamicCoefficient()
{
    return coefficient.getDynamicCoefficient();
}