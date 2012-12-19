//
//  RPDataManager.m
//  RPSystem
//
//  Created by av on 14.12.12.
//  Copyright (c) 2012 Mykhaylo. All rights reserved.
//

#import "RPDataManager.h"
#import "Classes+Utils.h"
#import "Races+Utils.h"
#import "Fighter+Utils.h"
#import "ItemWeapon+Utils.h"

const NSArray *listOfTablesToLoad;
const NSArray *classNameStorage;

static RPDataManager *RpDataManager = nil;

@interface RPDataManager ()

- (void)makeDBCopyIfNeeded;
- (NSMutableArray *)getDataFromTable:(NSString *)tableName;
- (void)initListOfTablenames;
- (void)processEntitiesToCoreData:(NSMutableArray *)entities forClass:(Class)clas;

@end

@implementation RPDataManager

+ (RPDataManager *)sharedInstance {
    
    if (RpDataManager == nil)
        RpDataManager = [[super alloc] init];
    return RpDataManager;
}

-(void)initDBIfNeeded {
    
    NSLog(@"Start Database initialization");
    [self makeDBCopyIfNeeded];
    [self initListOfTablenames];
    
    NSLog(@"Starting table import");
    for (int i = 0; i < [listOfTablesToLoad count]; i++) {
        
        NSMutableArray *entities = [self getDataFromTable:[listOfTablesToLoad objectAtIndex:i]];
        [self processEntitiesToCoreData:entities forClass:(Class)[classNameStorage objectAtIndex:i]];
    }
    
    NSLog(@"Done");
}

- (void)processEntitiesToCoreData:(NSMutableArray *)entities forClass:(Class)clas {
    
    for (int i = 0; i < [entities count]; i++) {

        NSDictionary *record = [entities objectAtIndex:i];
        
        [clas createEntityFromDictionary:record];
    }
}

- (void)initListOfTablenames {
    
    listOfTablesToLoad = [NSArray arrayWithObjects:@"Classes",
                          @"Races",
                          @"Fighter",
                          @"Weapons",
                          nil];
    
    for (int i = 0; i < [listOfTablesToLoad count]; i++) {
        
        classNameStorage = [NSArray arrayWithObjects:[Classes class],
                                       [Races class],
                                       [Fighter class],
                                       [ItemWeapon class],
                                       nil];
    }
}


- (void)makeDBCopyIfNeeded {
    
    BOOL success;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writtableDBPath = [documentsDirectory stringByAppendingPathComponent:@"myRP.rdb"];
    
    success = [fileManager fileExistsAtPath:writtableDBPath];
    if (success)
        return;
    NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"myRP.rdb"];
    success = [fileManager copyItemAtPath:defaultDBPath toPath:writtableDBPath error:&error];
    if (!success)
        NSAssert(0, @"Failed to create DB");
}

- (NSMutableArray *)getDataFromTable:(NSString *)tableName {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"myRP.rdb"];
    
    NSMutableArray *arrayOfClasses = [NSMutableArray array];
    
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) {
        
        NSString *request = [NSString stringWithFormat:@"select * from %@", tableName];
        const char *sql = [request UTF8String];
        
        sqlite3_stmt *searchStatement;
        if (sqlite3_prepare_v2(database, sql, -1, &searchStatement, NULL) == SQLITE_OK) {
            
            while (sqlite3_step(searchStatement) == SQLITE_ROW) {
                
                NSMutableDictionary *record = [NSMutableDictionary dictionary];
                
                for (int i = 0; i < sqlite3_column_count(searchStatement); i++) {
                    [record setValue:[NSString stringWithUTF8String:(char *)sqlite3_column_text(searchStatement, i)]
                              forKey:[NSString stringWithUTF8String:(char *)sqlite3_column_name(searchStatement, i)]];
                }
                [arrayOfClasses addObject:record];
            }
        }
    }
    
    return arrayOfClasses;
}

@end
