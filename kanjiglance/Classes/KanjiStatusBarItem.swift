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
    
    private var timer: NSTimer?
    
    private var kanjiStore: KanjiStore?
    private var kanji: Kanji?
    private let user: User
    
    init(user: User) {
        // initialize
        statusItem = NSStatusBar
            .systemStatusBar()
            .statusItemWithLength(NSVariableStatusItemLength)
        self.user = user
        
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
        
        user.addObserver(
            self,
            forKeyPath: "level",
            options: NSKeyValueObservingOptions.New,
            context: nil)
        
        setup()
    }
    
    deinit {
        stopTimer()
        eventMonitor?.stop()
    }
    
    func setup() {
        kanjiStore = KanjiStore(level: user.level)
        // update & start timer
        update()
        startTimer()
    }
    
    func update() {
        if let ks = kanjiStore {
            kanji = ks.getKanji()
        }
        
        if let k = kanji {
            statusItem.button?.title = "\(k.writing):\(k.firstMeaning())"
        }
    }
    
    // MARK:- Observe user values
    
    override func observeValueForKeyPath(
        keyPath: String?,
        ofObject object: AnyObject?,
        change: [String : AnyObject]?,
        context: UnsafeMutablePointer<Void>)
    {
        if object is User {
            setup()
        }
    }
    
    // MARK:- Kanji Timer
    
    func startTimer() {
        stopTimer()
        timer = NSTimer.scheduledTimerWithTimeInterval(
            user.interval,
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
            let vc = KanjiViewController(kanji: k, user: user)
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