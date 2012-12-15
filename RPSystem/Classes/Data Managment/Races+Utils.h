//
//  Races+Utils.h
//  RPSystem
//
//  Created by av on 14.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import "Races.h"
#import "DataTypesEnumeration.h"

@interface Races (Utils)

+ (void)createEntityFromDictionary:(NSDictionary *)dictionary;
+ (Races *)getCharacterRaceByType:(kAvailableRaces)type;

@end
