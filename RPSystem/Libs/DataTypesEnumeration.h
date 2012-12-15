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
    
    Healthy,
    LightWounds,
    Wounded,
    HeavyWounded,
    AlmostDead,
    Dead
} kHealthCondition;
