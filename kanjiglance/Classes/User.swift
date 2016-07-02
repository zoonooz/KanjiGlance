//
//  User.swift
//  kanjiglance
//
//  Created by Amornchai Kanokpullwad on 7/2/2559 BE.
//  Copyright © 2559 zoonref. All rights reserved.
//

import Foundation

class User {
    
    private let UserLevel = "level"
    private let preference = NSUserDefaults.standardUserDefaults()
    
    // default values
    var level: Int = 5 {
        didSet {
            preference.setInteger(level, forKey: UserLevel)
        }
    }
    
    init() {
        let lv = preference.integerForKey(UserLevel)
        if lv < 6 && lv > 0 { level = lv }
    }
}