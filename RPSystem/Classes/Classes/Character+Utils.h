//
//  Character+Utils.h
//  RPSystem
//
//  Created by Michael on 15.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import "Character.h"
#import "DataTypesEnumeration.h"

@interface Character (Utils)

+ (Character *)createCharacterWithRace:(kAvailableRaces)race
                              andClass:(kAvailableClasses)clas;

- (kHealthCondition)changeCurrentHPFor:(int)points;
- (kHealthCondition)currentHealthCondition;

@end
