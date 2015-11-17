//
//  NSDictionary+SHBAdditions.h
//  Mobilbanken
//
//  Created by David Arve on 2012-09-28.
//  Copyright (c) 2012 Handelsbanken. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (SHBAdditions)

- (NSArray*)arrayOfObjectsOfClass:(Class)classType forKey:(NSString*)key;

- (id)objectFromDictOfClass:(Class)classType forKey:(NSString*)key;

- (id)objectOfClass:(Class)classType forKey:(NSString *)key;

/* Convenience methods */
- (NSArray *)arrayForKey:(NSString *)key;
- (NSString *)stringForKey:(NSString *)key;
- (NSDictionary *)dictionaryForKey:(NSString *)key;
- (NSNumber *)numberForKey:(NSString *)key;

/**
 Lenient Boolean value that indicates whether the
 receiver uses heuristics to guess at the number
 which is intended by a string.
 */
- (NSNumber *)numberForKey:(NSString *)key lenient:(BOOL)lenient;
-(BOOL)booleanForKey:(NSString*)key;
/**
 Use this method for accessing HTTP header fields
 as they are case insensitive, objectForKey: is
 case sensitive.
 */
- (NSString *)stringForCaseInsensitiveKey:(NSString *)key;

- (id)safeObjectForKey:(id)value;

- (NSString*)literalsDescription;


@end
