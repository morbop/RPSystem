//
//  Classes+Utils.h
//  RPSystem
//
//  Created by av on 14.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import "Classes.h"
#import "DataTypesEnumeration.h"

@interface Classes (Utils)

+ (void)createEntityFromDictionary:(NSDictionary *)dictionary;
+ (Classes *)getCharacterClassByType:(kAvailableClasses)type;

@end
