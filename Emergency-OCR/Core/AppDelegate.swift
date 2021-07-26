//
//  AppDelegate.swift
//  Emergency OCR 2
//
//  Created by Jan Kožnárek on 25.07.2021.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate, NSWindowDelegate {

    var activity: Any?
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)

    var popover: NSPopover!
    var mainMenu = NSMenu()
    

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if ProcessInfo.processInfo.responds(to: #selector(ProcessInfo.beginActivity(options:reason:))) {
            activity = ProcessInfo.processInfo.beginActivity(options: ProcessInfo.ActivityOptions(rawValue: 0x00ffffff), reason: "screenshot")
        }
        
        
        setupStatusItem()
        
        preparePopover()
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    
    //click on the menubar icon
    @objc func clickHandler(sender: NSStatusItem) {
        
        let event = NSApp.currentEvent!
        
        switch event.type {
        case .rightMouseUp:
            //right click
            
            statusItem.menu = mainMenu
            statusItem.button?.performClick(nil)
            statusItem.menu = nil
            
            break
        case .leftMouseUp:
            //left click
            
            print("Clicked!!!!")
            togglePopover()
            break
        default:
            ()
        }
        
    }
    
    @objc func togglePopover() {
        if popover.isShown {
            closePopover()
        } else {
            showPopover()
        }
    }
    
    
    func showPopover() {
        if let button = statusItem.button {
            NSRunningApplication.current.activate(options: NSApplication.ActivationOptions.activateIgnoringOtherApps)
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
    }
    
    
    @objc func closePopover() {
        popover.performClose(Any?.self)
    }
    
}
    


//MARK: SETUP METHODS
extension AppDelegate {
    
    public func preparePopover() {
        
        if popover != nil {
            closePopover()
            popover = nil
        }
        
//        let size = NSSize(width: SM.get(.width), height: SM.get(.height))
        
        popover = NSPopover()
        popover.contentViewController = PopoverVC.getPopoverVC()
    
        popover.contentViewController?.loadView()
        popover.behavior = .applicationDefined
        
    }
    
    
    private func setupStatusItem() {
        
        print("setupStatusItem")
        
        statusItem.button!.image?.isTemplate = true
//        statusItem.button!.image =
        statusItem.button!.imageScaling = .scaleProportionallyUpOrDown
        statusItem.button!.action = #selector(self.clickHandler(sender:))
        statusItem.button!.sendAction(on: [.leftMouseUp, .rightMouseUp, .mouseEntered, .leftMouseDragged, .mouseMoved, .otherMouseDragged])
        statusItem.button!.menu = mainMenu
        
        statusItem.button?.window!.registerForDraggedTypes([.fileURL])
        statusItem.button?.window?.delegate = self
        
    }


}
