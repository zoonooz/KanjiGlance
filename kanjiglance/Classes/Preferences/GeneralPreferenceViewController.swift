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
    
    @IBOutlet weak var n1Button: NSButton!
    @IBOutlet weak var n2Button: NSButton!
    @IBOutlet weak var n3Button: NSButton!
    @IBOutlet weak var n4Button: NSButton!
    @IBOutlet weak var n5Button: NSButton!
    
    @IBOutlet weak var i1Button: NSButton!
    @IBOutlet weak var i2Button: NSButton!
    @IBOutlet weak var i3Button: NSButton!
    @IBOutlet weak var i4Button: NSButton!
    @IBOutlet weak var i5Button: NSButton!
    
    let user: User
    var levelButtons: [NSButton] = []
    var intervalButtons: [NSButton] = []
    let intervals: [NSTimeInterval] = [30, 60, 300, 900, 1800]
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(user: User) {
        self.user = user
        super.init(nibName: "GeneralPreferenceViewController", bundle: nil)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpKanjiLevelButtons()
        setupIntervalButtons()
    }
    
    // MARK:- Kanji Level
    
    private func setUpKanjiLevelButtons() {
        levelButtons.appendContentsOf([n1Button, n2Button, n3Button, n4Button, n5Button])
        levelButtons[user.level - 1].state = NSOnState
    }
    
    @IBAction func levelButtonClick(sender: NSButton) {
        _ = levelButtons.indexOf(sender).map {
            user.level = $0 + 1
        }
    }
    
    // MARK:- Change Interval
    
    private func setupIntervalButtons() {
        intervalButtons.appendContentsOf([i1Button, i2Button, i3Button, i4Button, i5Button])
        if let index = intervals.indexOf(user.interval) {
            intervalButtons[index].state = NSOnState
        } else {
            intervalButtons[1].state = NSOnState
        }
    }
    
    @IBAction func intervalButtonClick(sender: NSButton) {
        _ = intervalButtons.indexOf(sender).map {
            user.interval = intervals[$0]
        }
    }
}