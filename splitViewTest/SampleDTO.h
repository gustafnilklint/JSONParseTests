//
//  SampleDTO.h
//  splitViewTest
//
//  Created by Gustaf Nilklint on 2015-11-17.
//  Copyright © 2015 Gustaf Nilklint. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SampleDTO : NSObject

@property (nonatomic, readonly) NSNumber *amount;
@property (nonatomic, readonly) NSString *amountFormatted;

-(instancetype) initWithDictionary:(NSDictionary*) dictionary;

@end
