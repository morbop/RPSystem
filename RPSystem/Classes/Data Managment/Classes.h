//
//  Classes.h
//  RPSystem
//
//  Created by av on 14.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Classes : NSManagedObject

@property (nonatomic, retain) NSString * clasName;
@property (nonatomic, retain) NSString * descript;
@property (nonatomic, retain) NSNumber * hitDice;
@property (nonatomic, retain) NSNumber * serial;

@end
