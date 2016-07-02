//
//  KanjiStore.swift
//  kanjiglance
//
//  Created by Amornchai Kanokpullwad on 7/2/2559 BE.
//  Copyright © 2559 zoonref. All rights reserved.
//

import Foundation

class KanjiStore {
    
    private let kanjiList: [Kanji]
    private var index = 0
    
    init?(level: Int) {
        let lv = level < 6 && level > 0 ? level : 5
        let fileName = "n\(lv)"
        if let parser = CSVParser(fileName: fileName) {
            let list = KanjiStore.shuffle(parser.list())
            kanjiList = list.map { Kanji(raw: $0) }
        } else {
            return nil
        }
    }
    
    func getKanji() -> Kanji {
        let kanji = kanjiList[index]
        index += 1
        if index > kanjiList.count - 1 { index = 0 }
        return kanji
    }
    
    //MARK: - Util
    
    private class func shuffle<T>(array: [T]) -> [T] {
        var mutable = array
        let count = array.count
        for i in 0...count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - 1)))
            if i != j {
                swap(&mutable[i], &mutable[j])
            }
        }
        return mutable
    }
}