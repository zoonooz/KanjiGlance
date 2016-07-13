//
//  GeneralPreferenceViewController.swift
//  kanjiglance
//
//  Created by Amornchai Kanokpullwad on 7/10/2559 BE.
//  Copyright © 2559 zoonref. All rights reserved.
//

import Cocoa
import MASPreferences

class GeneralPreferenceViewController: NSViewController, MASPreferencesViewController {
    override var identifier: String? { get { return "general" } set { super.identifier = newValue} }
    var toolbarItemImage: NSImage! = NSImage(named: NSImageNamePreferencesGeneral)
    var toolbarItemLabel: String! = "General"
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init() {
        super.init(nibName: "GeneralPreferenceViewController", bundle: nil)!
    }
}