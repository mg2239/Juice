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
        self.statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
        updateTitle()
        let menu = initMenu()
        self.statusBarItem.menu = menu
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in self.updateTitle()})
        NSApp.activate(ignoringOtherApps: true)
    }
    
    func initMenu() -> NSMenu {
        let menu = NSMenu()
        let prefs = NSMenuItem()
        prefs.title = "Preferences..."
        let quit = NSMenuItem(title: "Quit Juice", action: #selector(quit), keyEquivalent: "q")
        menu.addItem(prefs)
        menu.addItem(quit)
        return menu
    }
    
    @objc private func quit() {
        NSApplication.shared.terminate(self)
    }
    
    func updateTitle() {
        if let button = self.statusBarItem.button {
            button.title = Battery().getTimeRemaining()
        }
    }
}
