//
//  splitViewTestTests.m
//  splitViewTestTests
//
//  Created by Gustaf Nilklint on 2015-11-16.
//  Copyright © 2015 Gustaf Nilklint. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDictionary+SHBAdditions.h"

@interface JSONDecimalTests : XCTestCase

@end

@implementation JSONDecimalTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testJSON;
{
    
    NSString *JsonString = @"{\"amount\" : 9.05 }";
    NSData *jsonData = [JsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError* error;
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:jsonData
                                                         options:kNilOptions
                                                           error:&error];
    
    
    
    NSNumber *x = @9.05;
    NSNumber *y = [NSNumber numberWithFloat: [x floatValue]];
    NSNumber *z = [NSNumber numberWithFloat:[json numberForKey:@"amount"].floatValue];
    
    NSLog(@"\n\nX Value: %@\nY Value: %@\nZ Value: %@\nJson Value: %@\n\n", x, y, z, json);
}


- (void)testJSONDoubleParse;
{
    for (int i = 1; i <= 9; i++) {
        for (int j = 0; j<= 99; j++){
            NSDictionary *dict = [self dictionaryWithInteger:i andDecimalPart:j];
            
            NSNumber *parsedNumber = [NSNumber numberWithDouble:[dict numberForKey:@"amount"].doubleValue];
            NSString *reference = [dict stringForKey:@"amountString"];
            
            NSLog(@"\n\nOriginalValue: %@\nZ Value: %@\nJson Value: %@\n\n",reference ,parsedNumber, dict);
            XCTAssertEqualObjects([parsedNumber stringValue], reference);
        }
    }
}

- (void)testJSONDirectParse;
{
    for (int i = 1; i <= 9; i++) {
        for (int j = 0; j<= 99; j++){
            NSDictionary *dict = [self dictionaryWithInteger:i andDecimalPart:j];
            
            NSNumber *parsedNumber = [dict numberForKey:@"amount"];
            NSString *reference = [dict stringForKey:@"amountString"];
            
            NSLog(@"\n\nOriginalValue: %@\nZ Value: %@\nJson Value: %@\n\n",reference ,parsedNumber, dict);
            XCTAssertEqualObjects([parsedNumber stringValue], reference);
        }
    }
}

- (void)testJSONfloatParse;
{
    for (int i = 1; i <= 99; i++) {
        for (int j = 0; j<= 99; j++){
            NSDictionary *dict = [self dictionaryWithInteger:i andDecimalPart:j];
    
            NSNumber *parsedNumber = [NSNumber numberWithFloat:[dict numberForKey:@"amount"].floatValue];
            NSString *reference = [dict stringForKey:@"amountString"];
            
            NSLog(@"\n\nOriginalValue: %@\nZ Value: %@\nJson Value: %@\n\n",reference ,parsedNumber, dict);
            XCTAssertEqualObjects([parsedNumber stringValue], reference);
        }
    }
}


- (NSDictionary*)dictionaryWithInteger:(int)intPart andDecimalPart:(int)dec;
{
    NSString *amountString = [NSString stringWithFormat:@"%d",intPart];
    if (dec > 0) {
        NSString *decimal = [NSString stringWithFormat:@"%d",dec];
        if (decimal.length == 1) {
            decimal = [NSString stringWithFormat:@"0%d",dec];
        }else if (decimal.length == 2 && dec%10 == 0){
            decimal = [NSString stringWithFormat:@"%d",dec/10];
        }
        amountString = [NSString stringWithFormat:@"%d.%@",intPart,decimal];
    }
    NSString *JsonString = [NSString stringWithFormat: @"{\"amount\" : %@, \"amountString\" : \"%@\"}", amountString, amountString];
    NSData *jsonData = [JsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError* error;
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:jsonData
                                                         options:kNilOptions
                                                           error:&error];
    return json;
}

@end
