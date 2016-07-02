//
//  EventMonitor.swift
//  wanibar
//
//  Created by Amornchai Kanokpullwad on 6/8/2559 BE.
//  Copyright © 2559 zoonref. All rights reserved.
//

import Cocoa

class EventMonitor {
    private var monitor: AnyObject?
    private let mask: NSEventMask
    private let handler: NSEvent? -> ()
    
    init(mask: NSEventMask, handler: NSEvent? -> ()) {
        self.mask = mask
        self.handler = handler
    }
    
    deinit {
        stop()
    }
    
    func start() {
        monitor = NSEvent.addGlobalMonitorForEventsMatchingMask(mask, handler: handler)
    }
    
    func stop() {
        if monitor != nil {
            NSEvent.removeMonitor(monitor!)
            monitor = nil
        }
    }
}
