
//
//  NSDictionary+SHBAdditions.m
//  Mobilbanken
//
//  Created by David Arve on 2012-09-28.
//  Copyright (c) 2012 Handelsbanken. All rights reserved.
//

#import "NSDictionary+SHBAdditions.h"

@implementation NSDictionary (SHBAdditions)

- (NSArray *)arrayForKey:(NSString *)key;
{
    NSArray *arrayForKey = [self objectOfClass:[NSArray class] forKey:key];
    if (!arrayForKey) {
        // This is to make pageDTO-wrapped arrays transparent look for array
        // inside, called data.
        NSDictionary *dictionaryForKey = [self objectOfClass:[NSDictionary class] forKey:key];
        arrayForKey = [dictionaryForKey arrayForKey:@"data"];
    }
    return arrayForKey;
}

- (NSString *)stringForKey:(NSString *)key;
{
    return [self objectOfClass:[NSString class] forKey:key];
}

- (NSDictionary *)dictionaryForKey:(NSString *)key;
{
    return [self objectOfClass:[NSDictionary class] forKey:key];
}


/**
 Lenient Boolean value that indicates whether the
 receiver uses heuristics to guess at the number
 which is intended by a string.
 */
- (NSNumber *)numberForKey:(NSString *)key lenient:(BOOL)lenient;
{
    NSNumber *number = [self objectOfClass:[NSNumber class] forKey:key];
    
    if (!number && lenient) {
        // fall back to parse localized decimal number e.g. "0,6" or "14 799,12" note the non-standard whitespace char...
        NSString *stringValue = [self stringForKey:key];
        if ([stringValue length] > 0) {
            NSArray* words = [stringValue componentsSeparatedByCharactersInSet :[NSCharacterSet whitespaceCharacterSet]];
            NSString* nospacestring = [words componentsJoinedByString:@""];
            NSString *decimalString = [nospacestring stringByReplacingOccurrencesOfString:@"," withString:@"."];
            double decimalValue = [decimalString doubleValue];
            return [NSNumber numberWithDouble:decimalValue];
        }
    }
    
    return number;
}

- (NSNumber *)numberForKey:(NSString *)key;
{
    return [self numberForKey:key lenient:NO];
}

-(BOOL)booleanForKey:(NSString*)key;
{
    NSNumber* numberForKey = [self numberForKey:key];
    return numberForKey.integerValue>0;

}

- (NSArray*)arrayOfObjectsOfClass:(Class)classType forKey:(NSString*)key {
    NSArray* dictObjects = [self arrayForKey:key];
    
    NSMutableArray* ret = [NSMutableArray array];
    
    for(NSDictionary* dict in dictObjects) {
        if([dict isKindOfClass:[NSDictionary class]]) {
            id obj = [dict objectFromClass:classType];
            [ret addObject:obj];
        }
    }
    
    return ret;
}

- (id)objectFromClass:(Class)classType {
    id obj = [classType alloc];
    if(obj && [obj respondsToSelector:@selector(initWithDictionary:)]) {
        return [obj initWithDictionary:self];
    } else {
        return nil;
    }
}

- (id)objectFromDictOfClass:(Class)classType forKey:(NSString*)key {
    return [[self dictionaryForKey:key] objectFromClass:classType];
}

- (id)objectOfClass:(Class)class forKey:(NSString *)key;
{
    id obj = [self objectForKey:key];
    if ([obj isKindOfClass:class]) {
        return obj;
    }
//    NSLog(@"Key:%@ for objectOfclass: %@ results in nil in dictionary %@", key, class, self);
    return nil;
}

- (NSString *)stringForCaseInsensitiveKey:(NSString *)key;
{
    NSString *result = nil;
    for ( NSString *dictionaryKey in [self allKeys] ) {
        if ( [key caseInsensitiveCompare:dictionaryKey] ==
            NSOrderedSame ) {
            result = [self stringForKey:dictionaryKey];
        }
    }
    return result;
}


- (id)safeObjectForKey:(id)key;
{
    id value = [self objectForKey:key];
    if (value == [NSNull null]) {
        return nil;
    }
    return value;
}

- (NSString*)literalsDescription;
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (error) NSLog(@"Error: %@", error);
    
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                 encoding:NSUTF8StringEncoding];
    NSString *litheralsString = [jsonString stringByReplacingOccurrencesOfString:@"{" withString:@"@{"];
    litheralsString = [litheralsString stringByReplacingOccurrencesOfString:@"[" withString:@"@["];
    litheralsString = [litheralsString stringByReplacingOccurrencesOfString:@" \"" withString:@"@\""];
    
    return litheralsString;
}

@end
