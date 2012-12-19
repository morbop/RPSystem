//
//  ItemArmour.h
//  RPSystem
//
//  Created by av on 19.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Item.h"

@class ItemArmour;

@interface ItemArmour : Item

@property (nonatomic, retain) NSNumber * acBonus;
@property (nonatomic, retain) NSNumber * subType;
@property (nonatomic, retain) NSSet *eqHead;
@property (nonatomic, retain) NSSet *eqTorso;
@end

@interface ItemArmour (CoreDataGeneratedAccessors)

- (void)addEqHeadObject:(ItemArmour *)value;
- (void)removeEqHeadObject:(ItemArmour *)value;
- (void)addEqHead:(NSSet *)values;
- (void)removeEqHead:(NSSet *)values;

- (void)addEqTorsoObject:(ItemArmour *)value;
- (void)removeEqTorsoObject:(ItemArmour *)value;
- (void)addEqTorso:(NSSet *)values;
- (void)removeEqTorso:(NSSet *)values;

@end
