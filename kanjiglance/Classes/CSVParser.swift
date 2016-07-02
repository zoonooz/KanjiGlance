//
//  CSVParser.swift
//  kanjiglance
//
//  Created by Amornchai Kanokpullwad on 7/2/2559 BE.
//  Copyright © 2559 zoonref. All rights reserved.
//

import Foundation

class CSVParser {
    
    private let content: String
    
    /**
     Init CSV data source with file name in bundle
     
     - parameter fileName: file name without extension
     */
    init?(fileName: String) {
        var content: String?
        do {
            if let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "csv") {
                content = try String(contentsOfFile: path)
            }
        } catch {
            return nil
        }
        self.content = content!
    }
    
    /**
     Lines of string from csv
     
     - returns: array of string from lines
     */
    func list() -> [String] {
        return content.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
    }
    
}