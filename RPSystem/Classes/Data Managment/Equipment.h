//
//  Equipment.h
//  RPSystem
//
//  Created by av on 19.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Character, ItemWeapon, ItemArmour;

@interface Equipment : NSManagedObject

@property (nonatomic, retain) Character *character;
@property (nonatomic, retain) ItemWeapon *rightHand;
@property (nonatomic, retain) ItemWeapon *leftHand;
@property (nonatomic, retain) ItemArmour *torso;
@property (nonatomic, retain) ItemArmour *head;

@end
