//
//  PDFHandlerVIewController.swift
//  coco_app
//
//  Created by dengjiangzhou on 2018/7/26.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import Cocoa
import Quartz.PDFKit

class PDFHandlerVIewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        
        let pdfView = PDFView(frame: view.bounds)
        pdfView.autoresizingMask = [.width, .height]
        
        view.addSubview(pdfView)
        pdfView.acceptsDraggedFiles = true
        
        
    }
    
    
    
    @IBAction func deleteAllBookmarks(_ sender: Any) {
        
        
        
        
        
    }
    
    
/*
     
     
     // 给 menu item ， 选择方法
     
     
     These functions will be called by the menus and they will call the button action functions. You could have the menu items calling the button action functions directly, but I chose to do it this way to make the sequence of events more obvious when debugging. Save the file and close the Assistant Editor.
     
     Control-drag from the Start menu item up to the orange block that indicates the First Responder. A popup will appear showing an enormous list of options. Type “de” to scroll quickly to the correct section and select startTimerMenuItemSelected.
     
     */
    
    
    
}
