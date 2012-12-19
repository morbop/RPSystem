//
//  ItemWeapon.h
//  RPSystem
//
//  Created by av on 19.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Item.h"

@interface ItemWeapon : Item

@property (nonatomic, retain) NSNumber * damageRoll;
@property (nonatomic, retain) NSNumber * range;
@property (nonatomic, retain) NSNumber * rollQnty;
@property (nonatomic, retain) NSNumber * subType;
@property (nonatomic, retain) NSNumber * isTwoHanded;
@property (nonatomic, retain) NSNumber * acBonus;

@end
