//
//  Classes.h
//  RPSystem
//
//  Created by Michael on 15.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Character;

@interface Classes : NSManagedObject

@property (nonatomic, retain) NSString * clasName;
@property (nonatomic, retain) NSString * descript;
@property (nonatomic, retain) NSNumber * hitDice;
@property (nonatomic, retain) NSNumber * serial;
@property (nonatomic, retain) NSSet *characters;
@end

@interface Classes (CoreDataGeneratedAccessors)

- (void)addCharactersObject:(Character *)value;
- (void)removeCharactersObject:(Character *)value;
- (void)addCharacters:(NSSet *)values;
- (void)removeCharacters:(NSSet *)values;

@end
