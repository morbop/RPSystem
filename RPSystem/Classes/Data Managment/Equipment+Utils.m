//
//  Equipment+Utils.m
//  RPSystem
//
//  Created by av on 19.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import "Equipment+Utils.h"
#import "Character+Utils.h"
#import "Item.h"
#import "ItemWeapon+Utils.h"
#import "ItemArmour+Utils.h"
#import "DataTypesEnumeration.h"

@implementation Equipment (Utils)

+ (Equipment *)createEquipment {
    
    Equipment *equipment = [Equipment MR_createEntity];
    
    return equipment;
}

- (void)equipItem:(Item *)item {
    ItemWeapon *weapon = (ItemWeapon *)item;
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
            
            break;
        default:
            break;
    }
}

- (int)getACValue {
    
    int aC = 0;
    
    if (self.rightHand)
        aC += [self.rightHand.acBonus intValue];
    if (self.torso)
        //aC += self.torso
    
    return aC;
}

- (void)removeItemFromRightHand {
    
    self.rightHand = nil;
}

- (void)removeItemFromLeftHand {
    
    self.leftHand = nil;
}

@end
