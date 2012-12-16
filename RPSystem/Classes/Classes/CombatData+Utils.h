//
//  CombatData+Utils.h
//  RPSystem
//
//  Created by Michael on 15.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import "CombatData.h"

@interface CombatData (Utils)

+ (CombatData *)combatDataForCharacter;

- (NSArray *)arrayOfAttackValues;

@end
