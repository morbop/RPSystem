//
//  Races.h
//  RPSystem
//
//  Created by av on 14.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Races : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * descript;
@property (nonatomic, retain) NSNumber * strMod;
@property (nonatomic, retain) NSNumber * dexMod;
@property (nonatomic, retain) NSNumber * conMod;
@property (nonatomic, retain) NSNumber * intMod;
@property (nonatomic, retain) NSNumber * wizMod;
@property (nonatomic, retain) NSNumber * chaMod;
@property (nonatomic, retain) NSNumber * serial;

@end
