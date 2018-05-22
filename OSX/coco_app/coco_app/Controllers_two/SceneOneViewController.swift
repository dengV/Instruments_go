//
//  SceneOneViewController.swift
//  coco_app
//
//  Created by dengjiangzhou on 2018/5/21.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import Cocoa

class SceneOneViewController: NSViewController {

    
    @IBOutlet weak var timeLeftField: NSTextField!
    
    @IBOutlet weak var eggImageView: NSImageView!
    
    
    @IBOutlet weak var startButton: NSButton!
    @IBOutlet weak var stopButton: NSButton!
    @IBOutlet weak var resetButton: NSButton!
    
    
    var eggTimer = EggTimer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eggTimer.delegate = self
        
        
        
    }
    
    
    
    
    @IBAction func startButtonClicked(_ sender: Any) {
        
        
        
        
    }
    
    
    
    @IBAction func stopButtonClicked(_ sender: Any) {
        
        
        
        
    }
    

    
    
    
    @IBAction func resetButtonClicked(_ sender: Any) {
        
        
        
    }
    
    
    
    
    // MARK: - IBActions - menus
    
    @IBAction func startTimerMenuItemSelected(_ sender: Any) {
        startButtonClicked(sender)
    }
    
    
    
    @IBAction func stopTimerMenuItemSelected(_ sender: Any) {
        stopButtonClicked(sender)
    }
    
    
    
    
    @IBAction func resetTimerMenuItemSelected(_ sender: Any) {
        resetButtonClicked(sender)
    }
    
    
}










extension SceneOneViewController: EggTimerProtocol{
    
    func timerHasFinished(_ timer: EggTimer) {
        
    }
    
    
    
    func timeRemaingOnTimer(_ timer: EggTimer, timeRemaining: TimeInterval) {
        
    }
    
    
    
}






extension SceneOneViewController{
    
    
    
    
    
    
    
}
