//
//  ItemArmour+Utils.h
//  RPSystem
//
//  Created by av on 19.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import "ItemArmour.h"
#import "DataTypesEnumeration.h"

@interface ItemArmour (Utils)

+ (void)createEntityFromDictionary:(NSDictionary *)dictionary;

+ (ItemArmour *)getArmourBySerial:(kArmourSerial)serial;

@end
