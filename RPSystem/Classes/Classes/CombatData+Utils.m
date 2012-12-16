//
//  CombatData+Utils.m
//  RPSystem
//
//  Created by Michael on 15.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import "CombatData+Utils.h"

@implementation CombatData (Utils)

+ (CombatData *)combatDataForCharacter {
    
    NSManagedObjectContext *localContext    = [NSManagedObjectContext MR_contextForCurrentThread];
    CombatData *combatData = [CombatData MR_createInContext:localContext];
    
    combatData.aC = [NSNumber numberWithInt: 10];
    
    return combatData;
}

- (NSArray *)arrayOfAttackValues {
    
    NSArray *arrayOfAttacks = [self.baseAttacks componentsSeparatedByString:@"/"];
    
    return arrayOfAttacks;
}

@end
