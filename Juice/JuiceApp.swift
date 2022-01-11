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
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the status item
        self.statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
        if let button = self.statusBarItem.button {
            button.title = Battery.getTimeRemaining()
            let menu = initMenu()
            self.statusBarItem.menu = menu
        }
        NSApp.activate(ignoringOtherApps: true)
    }
    
    func initMenu() -> NSMenu {
        let menu = NSMenu()
        let prefs = NSMenuItem()
        prefs.title = "Preferences..."
        let quit = NSMenuItem()
        quit.title = "Quit Juice"
        menu.addItem(prefs)
        menu.addItem(quit)
        return menu
    }
}
