//
//  Races+Utils.m
//  RPSystem
//
//  Created by av on 14.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import "Races+Utils.h"

@implementation Races (Utils)

+ (void)createEntityFromDictionary:(NSDictionary *)dictionary {
    
    NSManagedObjectContext *localContext    = [NSManagedObjectContext MR_contextForCurrentThread];
    
    Races *object = [Races MR_createInContext:localContext];
    [object MR_importValuesForKeysWithObject:dictionary];
}

+ (Races *)getCharacterRaceByType:(kAvailableRaces)type {
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"serial = %d", type];
    Races *race = [Races MR_findFirstWithPredicate:predicate];
    
    return race;
}

@end
