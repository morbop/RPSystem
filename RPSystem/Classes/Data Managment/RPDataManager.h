//
//  RPDataManager.h
//  RPSystem
//
//  Created by av on 14.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RPDataManager : NSObject {
    
    sqlite3 *database;
}

+ (RPDataManager *)sharedInstance;
- (void)initDBIfNeeded;

@end
