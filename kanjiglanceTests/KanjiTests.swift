//
//  KanjiTests.swift
//  kanjiglance
//
//  Created by Amornchai Kanokpullwad on 7/2/2559 BE.
//  Copyright © 2559 zoonref. All rights reserved.
//

import XCTest
@testable import kanjiglance

class KanjiTests: XCTestCase {
    
    let kanji = Kanji(raw: "日,ニチ ・ ジツ ・ ひ ・ -び ・ -か,day; sun; Japan; counter for days,kanji")
    
    func testInit() {
        XCTAssertEqual(kanji.writing, "日")
        XCTAssertEqual(kanji.reading, "ニチ ・ ジツ ・ ひ ・ -び ・ -か")
        XCTAssertEqual(kanji.meaning, "day; sun; Japan; counter for days")
    }
    
    func textFirstMeaning() {
        XCTAssertEqual(kanji.firstMeaning(), "day")
    }
}