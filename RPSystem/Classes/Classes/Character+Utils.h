//
//  Character+Utils.h
//  RPSystem
//
//  Created by Michael on 15.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import "Character.h"
#import "DataTypesEnumeration.h"

@class Item;

@interface Character (Utils)

+ (Character *)createCharacterWithRace:(kAvailableRaces)race
                              andClass:(kAvailableClasses)clas;

+ (Character *)createCharacterWithRace:(kAvailableRaces)race
                              andClass:(kAvailableClasses)clas
                                  name:(NSString *)name;

+ (Character *)createCharacterWithRace:(kAvailableRaces)race
                              andClass:(kAvailableClasses)clas
                                  name:(NSString *)name
                               ofLevel:(int)level;

- (kHealthCondition)changeCurrentHPFor:(int)points;
- (kHealthCondition)currentHealthCondition;

- (void)meleeAttackCharacter:(Character *)enemyCharacter;
- (void)attackedInMeleeByHitRoll:(int)hitRoll andDamRoll:(int)damRoll;

- (void)equipItem:(Item *)item;

@end
