//
//  Fighter.h
//  RPSystem
//
//  Created by av on 14.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Fighter : NSManagedObject

@property (nonatomic, retain) NSNumber * serial;
@property (nonatomic, retain) NSNumber * level;
@property (nonatomic, retain) NSString * baseAttackBonus;
@property (nonatomic, retain) NSNumber * fortSave;
@property (nonatomic, retain) NSNumber * refSave;
@property (nonatomic, retain) NSNumber * wilSave;

@end
