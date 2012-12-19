//
//  Item.h
//  RPSystem
//
//  Created by av on 19.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Item : NSManagedObject

@property (nonatomic, retain) NSString * descript;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * serial;
@property (nonatomic, retain) NSNumber * type;
@property (nonatomic, retain) NSDecimalNumber * weight;

@end
