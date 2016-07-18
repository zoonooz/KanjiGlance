//
//  User.swift
//  kanjiglance
//
//  Created by Amornchai Kanokpullwad on 7/2/2559 BE.
//  Copyright © 2559 zoonref. All rights reserved.
//

import Foundation

class User: NSObject {
    
    private let UserLevel = "user_level"
    private let UserInterval = "user_interval"
    private let preference = NSUserDefaults.standardUserDefaults()
    
    // default values
    dynamic var level: Int {
        didSet {
            preference.setInteger(level, forKey: UserLevel)
        }
    }
    
    dynamic var interval: NSTimeInterval {
        didSet {
            preference.setDouble(interval, forKey: UserInterval)
        }
    }
    
    override init() {
        let lv = preference.integerForKey(UserLevel)
        let intv = preference.doubleForKey(UserInterval)
        level = lv == 0 ? 5 : lv
        interval = intv == 0 ? 60 : intv
        super.init()
    }
}