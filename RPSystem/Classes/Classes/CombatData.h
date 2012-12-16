//
//  CombatData.h
//  RPSystem
//
//  Created by Michael on 15.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Character;

@interface CombatData : NSManagedObject

@property (nonatomic, retain) NSNumber * aC;
@property (nonatomic, retain) NSString * baseAttacks;
@property (nonatomic, retain) NSNumber * damRoll;
@property (nonatomic, retain) NSNumber * hitRoll;
@property (nonatomic, retain) NSNumber * chanceOfCritical;
@property (nonatomic, retain) NSNumber * criticalMuplitplayer;
@property (nonatomic, retain) NSNumber * conSave;
@property (nonatomic, retain) NSNumber * wilSave;
@property (nonatomic, retain) NSNumber * reflexSave;
@property (nonatomic, retain) Character *character;

@end
