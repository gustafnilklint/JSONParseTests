//
//  InterLanguageTest.swift
//  splitViewTest
//
//  Created by Gustaf Nilklint on 2015-11-17.
//  Copyright © 2015 Gustaf Nilklint. All rights reserved.
//

import XCTest

class InterLanguageTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCreatingTheDictInSwiftAndReadItBack() {
        
        let specification = [
            "amount" : [
                "amount" : 9.03,
                "amountFormatted" : "9.03"
            ]
        ]
        
        let dto = SampleDTO(dictionary: specification)
        
        print("\nThe amount: \(dto.amount)\nThe amountFormatted: \(dto.amountFormatted)\n")
        XCTAssertEqual(dto.amount.stringValue, dto.amountFormatted)
        
    }
    
    
    func testCreatingTheDict() {
        
        let specification = [
            "amount" : [
                "amount" : 9.03,
                "amountFormatted" : "9.03"
            ]
        ]
        
        let amount = specification["amount"]!["amount"] as! NSNumber
        let amountFormatted = specification["amount"]!["amountFormatted"] as! String
        print("\nThe amount: \(amount)\nThe amountFormatted: \(amountFormatted)\n")
        XCTAssertEqual(amount.stringValue, amountFormatted)
        
    }
    
    
}
