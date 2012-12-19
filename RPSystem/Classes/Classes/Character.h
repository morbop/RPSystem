//
//  Character.h
//  RPSystem
//
//  Created by av on 19.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Classes, CombatData, Races, Equipment;

@interface Character : NSManagedObject

@property (nonatomic, retain) NSNumber * cha;
@property (nonatomic, retain) NSNumber * con;
@property (nonatomic, retain) NSNumber * curHP;
@property (nonatomic, retain) NSNumber * dex;
@property (nonatomic, retain) NSNumber * inte;
@property (nonatomic, retain) NSNumber * level;
@property (nonatomic, retain) NSNumber * maxHP;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * serial;
@property (nonatomic, retain) NSNumber * str;
@property (nonatomic, retain) NSNumber * wiz;
@property (nonatomic, retain) Classes *clas;
@property (nonatomic, retain) CombatData *combatData;
@property (nonatomic, retain) Races *race;
@property (nonatomic, retain) Equipment *equipment;

@end
