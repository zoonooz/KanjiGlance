//
//  KanjiStatusBarItem.swift
//  kanjiglance
//
//  Created by Amornchai Kanokpullwad on 7/2/2559 BE.
//  Copyright © 2559 zoonref. All rights reserved.
//

import Cocoa

@objc class KanjiStatusBarItem: NSObject {
    
    private let statusItem: NSStatusItem
    private let popover = NSPopover()
    private var eventMonitor: EventMonitor?
    
    private let timeInterval: NSTimeInterval = 60
    private var timer: NSTimer?
    
    private var kanjiStore: KanjiStore?
    private var kanji: Kanji?
    private var user: User
    
    override init() {
        // initialize
        statusItem = NSStatusBar
            .systemStatusBar()
            .statusItemWithLength(NSVariableStatusItemLength)
        user = User()
        kanjiStore = KanjiStore(level: user.level)
        
        super.init()
        
        if let button = statusItem.button {
            button.target = self
            button.action = #selector(KanjiStatusBarItem.togglePopover(_:))
        }
        
        // add event monitor
        eventMonitor = EventMonitor(mask: [.LeftMouseDownMask, .RightMouseDownMask]) {
            [unowned self] event in
            if self.popover.shown {
                self.closePopover(event)
            }
        }
        eventMonitor?.start()
        
        // update & start timer
        update()
        startTimer()
    }
    
    deinit {
        stopTimer()
        eventMonitor?.stop()
    }
    
    func update() {
        if let ks = kanjiStore {
            kanji = ks.getKanji()
        }
        
        if let k = kanji {
            statusItem.button?.title = "\(k.writing):\(k.firstMeaning())"
        }
    }
    
    // MARK:- Kanji Timer
    
    func startTimer() {
        stopTimer()
        timer = NSTimer.scheduledTimerWithTimeInterval(
            timeInterval,
            target: self,
            selector: #selector(KanjiStatusBarItem.update),
            userInfo: nil,
            repeats: true)
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
 
    // MARK:- Popover
    
    func showPopover(sender: AnyObject?) {
        if let k = kanji {
            let vc = KanjiViewController(kanji: k)
            popover.contentViewController = vc
            
            if let button = statusItem.button {
                popover.showRelativeToRect(
                    button.bounds,
                    ofView: button,
                    preferredEdge: .MinY)
                stopTimer()
            }
        }
    }
    
    func closePopover(sender: AnyObject?) {
        popover.performClose(sender)
        startTimer()
    }
    
    func togglePopover(sender: AnyObject?) {
        if popover.shown {
            closePopover(sender)
        } else {
            showPopover(sender)
        }
    }
}