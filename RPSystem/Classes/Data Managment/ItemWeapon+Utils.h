//
//  ItemWeapon+Utils.h
//  RPSystem
//
//  Created by av on 19.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import "ItemWeapon.h"
#import "DataTypesEnumeration.h"

@interface ItemWeapon (Utils)

+ (void)createEntityFromDictionary:(NSDictionary *)dictionary;

+ (ItemWeapon *)getWeaponBySerial:(kWeaponSerial)serial;

@end
