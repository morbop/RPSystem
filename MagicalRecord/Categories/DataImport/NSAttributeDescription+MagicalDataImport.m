//
//  NSAttributeDescription+MagicalDataImport.m
//  Magical Record
//
//  Created by Saul Mora on 9/4/11.
//  Copyright 2011 Magical Panda Software LLC. All rights reserved.
//

#import "NSAttributeDescription+MagicalDataImport.h"
#import "NSManagedObject+MagicalDataImport.h"
#import "MagicalImportFunctions.h"

@implementation NSAttributeDescription (MagicalRecord_DataImport)

- (NSString *) MR_primaryKey;
{
    return nil;
}

- (id) MR_valueForKeyPath:(NSString *)keyPath fromObjectData:(id)objectData;
{
    id value = [objectData valueForKeyPath:keyPath];
    
    NSAttributeType attributeType = [self attributeType];
    NSString *desiredAttributeType = [[self userInfo] valueForKey:kMagicalRecordImportAttributeValueClassNameKey];
    if (desiredAttributeType) 
    {
        if ([desiredAttributeType hasSuffix:@"Color"])
        {
            value = colorFromString(value);
        }
    }
    else 
    {
        if (attributeType == NSDateAttributeType)
        {
            if (![value isKindOfClass:[NSDate class]]) 
            {
                NSString *dateFormat = [[self userInfo] valueForKey:kMagicalRecordImportCustomDateFormatKey];
                value = dateFromString([value description], dateFormat ?: kMagicalRecordImportDefaultDateFormatString);
            }
            //            value = adjustDateForDST(value);
        }
        if (attributeType == NSInteger32AttributeType)
        {
            if (![value isKindOfClass:[NSNumber class]])
            {
                value = [NSNumber numberWithInt:[value integerValue]];
            }
        }
        if (attributeType == NSDecimalAttributeType)
        {
            if (![value isKindOfClass:[NSDecimalNumber class]])
            {
                value = [NSDecimalNumber decimalNumberWithDecimal:[value decimalValue]];
            }
        }
        if (attributeType == NSBooleanAttributeType)
        {
            if (![value isKindOfClass:[NSNumber class]])
            {
                value = [NSNumber numberWithBool:[value boolValue]];
            }
        }
    }
    
    return value == [NSNull null] ? nil : value;   
}

@end
