//
//  ClassData.h
//  RPSystem
//
//  Created by Michael on 16.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ClassData : NSManagedObject

@property (nonatomic, retain) NSNumber * wilSave;
@property (nonatomic, retain) NSNumber * refSave;
@property (nonatomic, retain) NSNumber * fortSave;
@property (nonatomic, retain) NSString * baseAttackBonus;
@property (nonatomic, retain) NSNumber * level;
@property (nonatomic, retain) NSNumber * serial;

@end
