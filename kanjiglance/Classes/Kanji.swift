//
//  Kanji.swift
//  kanjiglance
//
//  Created by Amornchai Kanokpullwad on 7/2/2559 BE.
//  Copyright © 2559 zoonref. All rights reserved.
//

import Foundation

struct Kanji {
    var writing: String
    var reading: String
    var meaning: String
    
    init(raw: String) {
        let data = raw.componentsSeparatedByString("#")
        self.init(writing: data[0], reading: data[1], meaning: data[2])
    }
    
    init(writing: String, reading: String, meaning: String) {
        self.writing = writing
        self.reading = reading
        self.meaning = meaning
    }
    
    func firstMeaning() -> String {
        let meanings = meaning.componentsSeparatedByString(";")
        return meanings[0].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
}