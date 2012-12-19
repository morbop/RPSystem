//
//  Equipment+Utils.h
//  RPSystem
//
//  Created by av on 19.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import "Equipment.h"

@class Item;

@interface Equipment (Utils)

+ (Equipment *)createEquipment;

- (void)equipItem:(Item *)item;
- (int)getACValue;

@end
