//
//  JuiceApp.swift
//  Juice
//
//  Created by Matthew Guo on 1/11/22.
//

import Cocoa
import SwiftUI

@main
struct JuiceApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    // SwiftUI wants something here
    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    
    var popover: NSPopover!
    var statusBarItem: NSStatusItem!
    var timer: Timer!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
//        // Content
//        let contentView = PopupView()
//
//        // Popover
//        let popover = NSPopover()
//        popover.contentSize = NSSize(width: 200, height: 400)
//        popover.behavior = .transient
//        popover.contentViewController = NSHostingController(rootView: contentView)
//        self.popover = popover
//
//        // Status item
//        self.statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
//        updateTitle()
//        if let button = self.statusBarItem.button {
//            button.action = #selector(togglePopover(_:))
//        }
//        setupTimer(interval: 2)
//        NSApp.activate(ignoringOtherApps: true)
    }
    
    func updateTitle() {
        if let button = self.statusBarItem.button {
            button.title = Battery().getTimeRemaining()
        }
    }
    
    //    func initMenu() -> NSMenu {
    //        let menu = NSMenu()
    //        let quit = NSMenuItem(title: "Quit Juice", action: #selector(quit), keyEquivalent: "q")
    //        menu.addItem(quit)
    //        return menu
    //    }
    
    func setupTimer(interval: Double) {
        self.timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true, block: {_ in self.updateTitle()})
    }
    
    @objc func togglePopover(_ sender: AnyObject?) {
        if let button = self.statusBarItem.button {
            if self.popover.isShown {
                self.popover.performClose(sender)
            } else {
                self.popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
            }
        }
    }
    
    @objc static func quit() {
        NSApplication.shared.terminate(self)
    }
}
