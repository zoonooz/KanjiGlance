//
//  ReviewViewController.swift
//  wanibar
//
//  Created by Amornchai Kanokpullwad on 6/8/2559 BE.
//  Copyright © 2559 zoonref. All rights reserved.
//

import Cocoa
import MASPreferences

class KanjiViewController: NSViewController {
    
    @IBOutlet weak var kanjiTextField: NSTextField!
    @IBOutlet weak var firstMeaningTextField: NSTextField!
    @IBOutlet weak var meaingTextField: NSTextField!
    @IBOutlet weak var readingTextField: NSTextField!
    
    let kanji: Kanji
    let user: User
    
    private lazy var prefViewController: MASPreferencesWindowController = {
        let generalPref = GeneralPreferenceViewController(user: self.user)
        let pref = MASPreferencesWindowController(
            viewControllers: [generalPref],
            title: "Preferences")
        return pref
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init?(kanji: Kanji, user: User) {
        self.kanji = kanji
        self.user = user
        super.init(nibName: "KanjiViewController", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kanjiTextField.stringValue = kanji.writing
        firstMeaningTextField.stringValue = kanji.firstMeaning()
        meaingTextField.stringValue = kanji.meaning
            .stringByReplacingOccurrencesOfString(";", withString: ",")
        readingTextField.stringValue = kanji.reading
    }
    
    @IBAction func settingButtonPressed(sender: AnyObject) {
        prefViewController.showWindow(nil)
    }
}
