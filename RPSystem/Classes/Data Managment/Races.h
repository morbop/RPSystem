//
//  Races.h
//  RPSystem
//
//  Created by Michael on 15.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Character;

@interface Races : NSManagedObject

@property (nonatomic, retain) NSNumber * chaMod;
@property (nonatomic, retain) NSNumber * conMod;
@property (nonatomic, retain) NSString * descript;
@property (nonatomic, retain) NSNumber * dexMod;
@property (nonatomic, retain) NSNumber * intMod;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * serial;
@property (nonatomic, retain) NSNumber * strMod;
@property (nonatomic, retain) NSNumber * wizMod;
@property (nonatomic, retain) NSSet *characters;
@end

@interface Races (CoreDataGeneratedAccessors)

- (void)addCharactersObject:(Character *)value;
- (void)removeCharactersObject:(Character *)value;
- (void)addCharacters:(NSSet *)values;
- (void)removeCharacters:(NSSet *)values;

@end
