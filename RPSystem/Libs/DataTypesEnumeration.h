//
//  DataTypesEnumeration.h
//  RPSystem
//
//  Created by Michael on 15.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum  {
    
    raceHuman = 1,
    raceDwarf = 2,
    raceElf = 3
    
} kAvailableRaces;

typedef enum {
    
    classFighter = 1,
    classRanger = 2
    
} kAvailableClasses;

typedef enum {
    
    ShortSword = 1,
    Mace = 2,
    MediumShield = 3,
    UnarmedStrike = 4
    
} kWeaponSerial;

typedef enum {
    
    Healthy,
    LightWounds,
    Wounded,
    HeavyWounded,
    AlmostDead,
    Dead
} kHealthCondition;

typedef enum {
    
    Weapons = 100,
    Armour = 200,
    Usable = 300,
    Misc = 400,
    Quest = 500
} kItemTypes;

typedef enum {

    typeSword = 100100,
    typeAxe = 100200,
    typeShield = 100300,
    typeMace = 100400
} kWeaponTypes;


