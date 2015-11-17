//
//  objCTests.m
//  splitViewTest
//
//  Created by Gustaf Nilklint on 2015-11-17.
//  Copyright © 2015 Gustaf Nilklint. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SampleDTO.h"

@interface objCTests : XCTestCase

@end

@implementation objCTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    NSDictionary* specification = @{
                                    @"amount" : @{
                                            @"amount" : @9.3,
                                            @"amountFormatted" : @"9.03"
                                            }
                                    };
    
    SampleDTO *dto = [[SampleDTO alloc] initWithDictionary:specification];
    XCTAssertEqualObjects([dto.amount stringValue], dto.amountFormatted);
}


@end
