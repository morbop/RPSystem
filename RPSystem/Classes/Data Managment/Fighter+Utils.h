//
//  Fighter+Utils.h
//  RPSystem
//
//  Created by av on 14.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import "Fighter.h"

@interface Fighter (Utils)

+ (void)createEntityFromDictionary:(NSDictionary *)dictionary;
+ (Fighter *)fighterInfoForLevel:(NSNumber *)level;

@end
