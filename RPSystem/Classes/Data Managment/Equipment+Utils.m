//
//  Equipment+Utils.m
//  RPSystem
//
//  Created by av on 19.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import "DataTypesEnumeration.h"
#import "Equipment+Utils.h"
#import "Character+Utils.h"
#import "ItemWeapon+Utils.h"
#import "ItemArmour+Utils.h"
#import "Item.h"

@implementation Equipment (Utils)

+ (Equipment *)createEquipment {
    
    Equipment *equipment = [Equipment MR_createEntity];
    
    return equipment;
}

- (void)equipItem:(Item *)item {
    ItemWeapon *weapon = (ItemWeapon *)item;
    ItemArmour *armor = (ItemArmour *)item;
    switch ([item.type integerValue]) {
        case Weapons:
            
            if ([weapon.isTwoHanded boolValue]) {
                [self removeItemFromLeftHand];
                [self removeItemFromRightHand];
            }
            else {
                
                if ([weapon.subType intValue] == typeShield) {
                    
                    [self removeItemFromLeftHand];
                    self.leftHand = weapon;
                }
                else {
                    
                    [self removeItemFromRightHand];
                    self.rightHand = weapon;
                }
            }

            break;
        case Armour:
            
            if ([armor.subType intValue] == typeTorso) {
                
                self.torso = armor;
            }
            else {
                
                self.head = armor;
            }
            
            break;
        default:
            break;
    }
}

- (int)getACValue {
    
    int aC = 0;
    
    if (self.leftHand)
        aC += [self.leftHand.acBonus intValue];
    if (self.torso)
        aC += [self.torso.acBonus intValue];
    if (self.head)
        aC += [self.head.acBonus intValue];
    
    return aC;
}

- (void)removeItemFromRightHand {
    
    self.rightHand = nil;
}

- (void)removeItemFromLeftHand {
    
    self.leftHand = nil;
}

@end
