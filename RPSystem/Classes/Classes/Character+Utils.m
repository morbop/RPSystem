//
//  Character+Utils.m
//  RPSystem
//
//  Created by Michael on 15.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import "Character+Utils.h"
#import "Races+Utils.h"
#import "Classes+Utils.h"
#import "CombatData+Utils.h"
#import "Fighter+Utils.h"
#import "ClassData.h"
#import "Equipment+Utils.h"
#import "ItemWeapon+Utils.h"

@implementation Character (Utils)

#pragma mark - Initialize

+ (Character *)createCharacterWithRace:(kAvailableRaces)race
                              andClass:(kAvailableClasses)clas {
    
    Character *character = [Character MR_createEntity];
    
    character.race = [Races getCharacterRaceByType:race];
    character.clas = [Classes getCharacterClassByType:clas];
    character.combatData = [CombatData combatDataForCharacter];
    character.equipment = [Equipment createEquipment];
    [character.equipment equipItem:[ItemWeapon getWeaponBySerial:UnarmedStrike]];
    
    [character rollBasicAttributes];
    [character updateCombatDataForCurrentAttributes];
    character.level = [NSNumber numberWithInt:1];
    
    [character applyRacialTraits];
    [character applyClassChanges];
    
    
    
    character.maxHP = [NSNumber numberWithInt: [character calculateMaximumHitPoints]];
    character.curHP = [character.maxHP copy];
    
    return character;
}

+ (Character *)createCharacterWithRace:(kAvailableRaces)race andClass:(kAvailableClasses)clas name:(NSString *)name {
    
    Character *character = [Character createCharacterWithRace:race andClass:clas];
    
    character.name = name;
    
    return character;
}

+ (Character *)createCharacterWithRace:(kAvailableRaces)race andClass:(kAvailableClasses)clas name:(NSString *)name ofLevel:(int)level {
    
    Character *character = [Character createCharacterWithRace:race andClass:clas name:name];
    
    for (int j = 0; j < level; j++) {
        
        [character levelUp];
    }
    
    return character;
}

- (void)rollBasicAttributes {
    
    self.str = [NSNumber numberWithInt:((arc4random()%6) + (arc4random()%6) + (arc4random()%6) + 3)];
    self.dex = [NSNumber numberWithInt:((arc4random()%6) + (arc4random()%6) + (arc4random()%6) + 3)];
    self.con = [NSNumber numberWithInt:((arc4random()%6) + (arc4random()%6) + (arc4random()%6) + 3)];
    self.inte = [NSNumber numberWithInt:((arc4random()%6) + (arc4random()%6) + (arc4random()%6) + 3)];
    self.wiz = [NSNumber numberWithInt:((arc4random()%6) + (arc4random()%6) + (arc4random()%6) + 3)];
    self.cha = [NSNumber numberWithInt:((arc4random()%6) + (arc4random()%6) + (arc4random()%6) + 3)];
}

- (int)calculateMaximumHitPoints {
    
    int hitDice = [self.clas.hitDice intValue];
    int lvl = [self.level intValue];
    int conBonus = [self getBonusForAttributeValue:self.con];
    
    int maxHp = 0;
    
    for (int i = 0; i < lvl; i++) {
        
        maxHp += (arc4random()%hitDice) + conBonus + 1;
    }
    
    return maxHp;
}

- (void)levelUp {
    
    self.level = [NSNumber numberWithInt:[self.level intValue] + 1];
    int hpChange = arc4random() % [self.clas.hitDice intValue] + 1;
    
    [self changeCurrentHPFor:hpChange];
    [self changeMaximumHPFor:hpChange];
    
    [self updateCombatDataWith:[self getCurrentClassTable]];
}

#pragma mark - Health Control

- (kHealthCondition)changeCurrentHPFor:(int)points {
    
    self.curHP = [NSNumber numberWithInt:[self.curHP intValue] + points];
    
    return [self currentHealthCondition];
}

- (void)changeMaximumHPFor:(int)points {
    
    self.maxHP = [NSNumber numberWithInt:[self.maxHP intValue] + points];
}

- (kHealthCondition)currentHealthCondition {
    
//    if (self.curHP < 0)
//        return Dead;
//    NSDecimalNumber *damage = [NSDecimalNumber decimalNumberWithDecimal: [self.curHP decimalValue] / [self.maxHP decimalValue] ];
//    
//    if (damage == 1.0f)
//        return Healthy;
//    if (damage >= 0.8f)
//        return LightWounds;
//    if (damage >= 0.5f)
//        return Wounded;
//    if (damage >= 0.25f)
//        return HeavyWounded;
//    if (damage >= 0)
//        return AlmostDead;
    
    return Dead;
}

#pragma mark - Equipment

- (void)equipItem:(id)item {
    
    [self.equipment equipItem:item];
}

#pragma mark - Character Combat 

- (void)attackedInMeleeByHitRoll:(int)hitRoll andDamRoll:(int)damRoll {
    
    NSLog(@"He rolled %d and...", hitRoll);
    
    int totalAC = [self.combatData.aC intValue] + [self.equipment getACValue];
    
    if (hitRoll >= totalAC) {
        
        [self changeCurrentHPFor:-damRoll];
        NSLog(@"hit (AC:%d) opponentfor %d !", totalAC, damRoll);
    }
    else {
        
        NSLog(@"missed! (AC:%d)", totalAC);
    }
}

- (void)meleeAttackCharacter:(Character *)enemyCharacter {
    
    NSLog(@"%@ attack %@ using %@ in melee!", self.name, enemyCharacter.name, self.equipment.rightHand.name);
    
    NSArray *arrayOfAttacks = [self.combatData arrayOfAttackValues];
    
    for (int i = 0; i < [arrayOfAttacks count]; i++) {
        
        int finalHitRoll = [self hitRoll] + [[arrayOfAttacks objectAtIndex:i] intValue];
        int finalDamRoll = [self damageRoll] + [[arrayOfAttacks objectAtIndex:i] intValue];
        
        [enemyCharacter attackedInMeleeByHitRoll:finalHitRoll andDamRoll:finalDamRoll];
    }
}

- (int)hitRoll {
    
    int hitRoll = arc4random()%20 + 1;
    hitRoll += [self.combatData.hitRoll integerValue];
    
    return hitRoll;
}

- (int)damageRoll {
    
    int diceRoll = 0;
    
    for (int i = 0; i < [self.equipment.rightHand.rollQnty intValue]; i++)
    {
        diceRoll += [self rollDice:[self.equipment.rightHand.damageRoll intValue]];
    }

    return diceRoll;
}

#pragma mark - Combat Data methods

- (void)updateCombatDataWith:(ClassData *)characterClass {
    
    self.combatData.wilSave = characterClass.wilSave;
    self.combatData.reflexSave = characterClass.refSave;
    self.combatData.conSave = characterClass.fortSave;
    self.combatData.baseAttacks = characterClass.baseAttackBonus;
}

- (void)updateCombatDataForCurrentAttributes {
    
    self.combatData.aC = [NSNumber numberWithInt:[self.combatData.aC integerValue] +
                          [self getBonusForAttributeValue:self.dex]];
    self.combatData.damRoll = [NSNumber numberWithInt:[self getBonusForAttributeValue:self.str]];
    self.combatData.hitRoll = [NSNumber numberWithInt:[self getBonusForAttributeValue:self.str]];
}


#pragma mark - Class Methods

- (void)applyClassChanges {
    
    ClassData *characterClass = [self getCurrentClassTable];
    
    if (characterClass) {
        
        [self updateCombatDataWith:characterClass];
    }
}

- (ClassData *)getCurrentClassTable {
    
    ClassData *characterClass;
    switch ([self.clas.serial intValue]) {
        case classFighter:
            characterClass = (ClassData *)[Fighter fighterInfoForLevel:self.level];
            break;
        case classRanger:
            
            break;
        default:
            characterClass = nil;
            break;
    }
    
    return characterClass;
}

#pragma mark - Race methods

- (void)applyRacialTraits {
    
    self.str = [NSNumber numberWithInt:([self.str intValue] + [self.race.strMod intValue])];
    self.dex = [NSNumber numberWithInt:([self.dex intValue] + [self.race.dexMod intValue])];
    self.con = [NSNumber numberWithInt:([self.con intValue] + [self.race.conMod intValue])];
    self.wiz = [NSNumber numberWithInt:([self.wiz intValue] + [self.race.wizMod intValue])];
    self.inte = [NSNumber numberWithInt:([self.inte intValue] + [self.race.intMod intValue])];
    self.cha = [NSNumber numberWithInt:([self.cha intValue] + [self.race.chaMod intValue])];
}

#pragma mark - Misc

- (int)getBonusForAttributeValue:(NSNumber *)attributeValue {
    
    return ([attributeValue intValue] - 10) % 2;
}

- (int)rollDice:(int)dice {
    
    return arc4random() % dice + 1;
}

@end
