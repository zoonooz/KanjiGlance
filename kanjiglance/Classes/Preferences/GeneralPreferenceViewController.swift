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
    
    let user: User
    var levelButtons: [NSButton] = []
    
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
    }
    
    // MARK:- Kanji Level
    
    private func setUpKanjiLevelButtons() {
        levelButtons.appendContentsOf([n1Button, n2Button, n3Button, n4Button, n5Button])
        let lv = user.level
        levelButtons[lv - 1].state = NSOnState
    }
    
    @IBAction func levelButtonClick(sender: NSButton) {
        _ = levelButtons.indexOf(sender).map {
            user.level = $0 + 1
        }
    }
    
    
}