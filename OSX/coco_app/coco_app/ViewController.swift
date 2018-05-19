//
//  ViewController.swift
//  coco_app
//
//  Created by dengjiangzhou on 2018/5/20.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    
    
    
    @IBOutlet weak var nameField: NSTextField!
    
    
    @IBOutlet weak var helloLabel: NSTextField!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    @IBAction func sayButtonClicked(_ sender: NSButton) {
        
        var name = nameField.stringValue
        
        if name.isEmpty{
            name = "World"
            
        }
        
        
        let greeting = "Hello \(name)!"
        
        helloLabel.stringValue = greeting
        
        
        
        
        
        
        
        
        
        
        
        
    }
    

    
    
    
    
    
    
    

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    
    
    
    
    


}

