//
//  ItemWeapon+Utils.m
//  RPSystem
//
//  Created by av on 19.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import "ItemWeapon+Utils.h"

@implementation ItemWeapon (Utils)

+ (void)createEntityFromDictionary:(NSDictionary *)dictionary {
    
    NSManagedObjectContext *localContext    = [NSManagedObjectContext MR_contextForCurrentThread];
    
    ItemWeapon *object = [ItemWeapon MR_createInContext:localContext];
    
    [object MR_importValuesForKeysWithObject:dictionary];
}

+ (ItemWeapon *)getWeaponBySerial:(kWeaponSerial)serial {
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"serial = %d", serial];
    ItemWeapon *item = [ItemWeapon MR_findFirstWithPredicate:predicate];
    
    return item;
}

@end
