//
//  AppDelegate.swift
//  wanibar
//
//  Created by Amornchai Kanokpullwad on 6/8/2559 BE.
//  Copyright © 2559 zoonref. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    
    var statusItem: KanjiStatusBarItem?
    let user = User()

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        statusItem = KanjiStatusBarItem(user: user)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
}

