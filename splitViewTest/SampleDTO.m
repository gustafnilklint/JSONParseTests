//
//  SampleDTO.m
//  splitViewTest
//
//  Created by Gustaf Nilklint on 2015-11-17.
//  Copyright © 2015 Gustaf Nilklint. All rights reserved.
//

#import "SampleDTO.h"
#import "NSDictionary+SHBAdditions.h"

@interface SampleDTO ()
@property (nonatomic, strong) NSDictionary* dictionary;
@end

@implementation SampleDTO

-(instancetype) initWithDictionary:(NSDictionary*) dictionary {
    self = [super init];
    if (self) {
        self.dictionary = dictionary;
    }
    
    return self;
}


- (NSNumber *)amount;
{
    return [[self.dictionary dictionaryForKey:@"amount"] numberForKey:@"amount"];
}

- (NSString *)amountFormatted;
{
    return [[self.dictionary dictionaryForKey:@"amount"] stringForKey:@"amountFormatted"];
}

@end
