//
//  kanjiglanceTests.swift
//  kanjiglanceTests
//
//  Created by Amornchai Kanokpullwad on 7/2/2559 BE.
//  Copyright © 2559 zoonref. All rights reserved.
//

import XCTest
@testable import kanjiglance

class CSVParserTests: XCTestCase {
    
    func testParser() {
        let parser = CSVParser(fileName: "n5")
        XCTAssertNotNil(parser)
        
        let count = parser!.list().count
        XCTAssertEqual(count, 79)
    }
}