//
//  AppDelegate.swift
//  coco_app
//
//  Created by dengjiangzhou on 2018/5/20.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {


    
    @IBOutlet weak var startTimerMenuItem: NSMenuItem!
    @IBOutlet weak var stopTimerMenuItem: NSMenuItem!
    @IBOutlet weak var resetTimerMenuItem: NSMenuItem!
    
    
    @IBOutlet weak var deletePDFBookmarksMenuItem: NSMenuItem!
    
    

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        
        enableMenus(start: true, stop: false, reset: false )
        
        
        
    }
    
    
    
    

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}



extension AppDelegate{
    
    func enableMenus(start: Bool, stop: Bool, reset: Bool ){
        startTimerMenuItem.isEnabled = start
        stopTimerMenuItem.isEnabled = stop
        resetTimerMenuItem.isEnabled = reset
    }
    
}




/*
 
 
 Technical Q&A QA1649
 WARNING: The Copy Bundle Resources build phase contains this target's Info.plist file 'Info.plist'.
 Q:  Why am I getting "WARNING: The Copy Bundle Resources build phase contains this target's Info.plist file 'Info.plist'"? And how do I fix it?
 A: You are getting this warning because you probably added your Info.plist file to the Copy Bundle Resources build phase as shown in Figure 1.
 
 Figure 1  Remove Info.plist from the Copy Bundle Resources build phase.
 
 
 
 
 
 
 
 https://developer.apple.com/library/content/qa/qa1649/_index.html
 
 
 
 */
