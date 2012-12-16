//
//  Classes+Utils.m
//  RPSystem
//
//  Created by av on 14.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import "Classes+Utils.h"

@implementation Classes (Utils)

+ (void)createEntityFromDictionary:(NSDictionary *)dictionary {
    
    NSManagedObjectContext *localContext    = [NSManagedObjectContext MR_contextForCurrentThread];
    
    Classes *object = [Classes MR_createInContext:localContext];

    [object MR_importValuesForKeysWithObject:dictionary];
}

+ (Classes *)getCharacterClassByType:(kAvailableClasses)type {
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"serial = %d", type];
    Classes *clas = [Classes MR_findFirstWithPredicate:predicate];
    
    return clas;
}

@end
