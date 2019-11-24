//
//  AppDelegate.swift
//  translator
//
//  Created by sergemi on 24.11.2019.
//  Copyright © 2019 sergemi. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    ///////
    let languages = ["Русский", "Английский"]
    let languagesPref = ["ru", "en"]
    var fromLanguageIndex = 0
    var toLanguageIndex = 1
    
    @IBOutlet weak var fromLanguage: NSPopUpButton!
    @IBOutlet weak var toLanguage: NSPopUpButton!
    
    @IBOutlet var fromTextView: NSTextView!
    @IBOutlet var toTextView: NSTextView!
    
    @IBOutlet weak var swapBtn: NSButton!
    @IBOutlet weak var clearBtn: NSButton!
    
    override func awakeFromNib() {
        updateLanguagePopups()
    }
    
    func updateLanguagePopups() {
        fromLanguage.removeAllItems()
        fromLanguage.addItem(withTitle: languages[fromLanguageIndex])
        fromLanguage.addItem(withTitle: languages[toLanguageIndex])
        
        toLanguage.removeAllItems()
        toLanguage.addItem(withTitle: languages[toLanguageIndex])
        toLanguage.addItem(withTitle: languages[fromLanguageIndex])
    }
    
    @IBAction func onClear(_ sender: Any) {
        print("onClear")
    
        clear()
        
//        let alert = NSAlert()
//        alert.messageText = "message"
//        alert.informativeText = "info"
//        alert.alertStyle = .warning
//        alert.addButton(withTitle: "OK")
//        alert.runModal()
    }
    
    @IBAction func onSwap(_ sender: Any) {
        swap()
    }
    
    func clear() {
        fromTextView.textStorage?.setAttributedString(NSAttributedString(string: ""))
        toTextView.textStorage?.setAttributedString(NSAttributedString(string: ""))
    }
    
    func swap() {
        var swap = fromLanguageIndex
        fromLanguageIndex = toLanguageIndex
        toLanguageIndex = swap
        
        updateLanguagePopups()
    }
    
}

