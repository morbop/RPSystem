//
//  Fighter+Utils.m
//  RPSystem
//
//  Created by av on 14.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import "Fighter+Utils.h"

@implementation Fighter (Utils)

+ (void)createEntityFromDictionary:(NSDictionary *)dictionary {
    
    NSManagedObjectContext *localContext    = [NSManagedObjectContext MR_contextForCurrentThread];
    
    Fighter *object = [Fighter MR_createInContext:localContext];
    [object MR_importValuesForKeysWithObject:dictionary];
}

+ (Fighter *)fighterInfoForLevel:(NSNumber *)level {
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"level = %d", [level integerValue]];
    Fighter *fighter = [Fighter MR_findFirstWithPredicate:predicate];
    
    return fighter;
}

@end
