//
//  ItemArmour+Utils.m
//  RPSystem
//
//  Created by av on 19.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import "ItemArmour+Utils.h"

@implementation ItemArmour (Utils)

+ (void)createEntityFromDictionary:(NSDictionary *)dictionary {
    
    NSManagedObjectContext *localContext    = [NSManagedObjectContext MR_contextForCurrentThread];
    
    ItemArmour *object = [ItemArmour MR_createInContext:localContext];
    
    [object MR_importValuesForKeysWithObject:dictionary];
}

+ (ItemArmour *)getArmourBySerial:(kArmourSerial)serial {
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"serial = %d", serial];
    ItemArmour *item = [ItemArmour MR_findFirstWithPredicate:predicate];
    
    return item;
}

@end
