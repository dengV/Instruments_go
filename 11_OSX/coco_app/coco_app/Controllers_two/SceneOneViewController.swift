//
//  SceneOneViewController.swift
//  coco_app
//
//  Created by dengjiangzhou on 2018/5/21.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import Cocoa


import AVFoundation

//  To play a sound, you need to use the AVFoundation library. The ViewController will be playing the sound when the EggTimer tells its delegate that the timer has finished, so switch to ViewController.swift. At the top, you will see where the Cocoa library is imported.

class SceneOneViewController: NSViewController {

    
    @IBOutlet weak var timeLeftField: NSTextField!
    
    @IBOutlet weak var eggImageView: NSImageView!
    
    
    @IBOutlet weak var startButton: NSButton!
    @IBOutlet weak var stopButton: NSButton!                //      startButton  与   stopButton ， 配合使用
    
    @IBOutlet weak var resetButton: NSButton!
    
    
    var eggTimer = EggTimer()
    var preferences_sceneOne = Preferences()
    
    var soundPlayer: AVAudioPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eggTimer.delegate = self
        
        setupPrefers()
    }
    
    
    
    
    @IBAction func startButtonClicked(_ sender: Any) {
        if eggTimer.isPaused {
            eggTimer.resumeTimer()
        }
        else{
            eggTimer.duration = preferences_sceneOne.selectedTime
            
            //  There is one final set of edits needed. Earlier, you were using hard-coded values for timings - 360 seconds or 6 minutes. Now that ViewController has access to Preferences, you want to change these hard-coded 360's to prefs.selectedTime.
            
            //  kTimeConstants().durationTime             //              6
            
            //  改 对象， 把硬编码的 360s 改为
            
            eggTimer.timerStartsToFire()
        }
        
        configureButtonsAndMenus()
        prepareSound()
    }
    
    
    
    @IBAction func stopButtonClicked(_ sender: Any) {
        
        eggTimer.stopTimer()
        configureButtonsAndMenus()
    }
    

    
    
    
    @IBAction func resetButtonClicked(_ sender: Any) {
        eggTimer.resetTimer()
        
        updateDisplay(preferences_sceneOne.selectedTime )
        
        //   kTimeConstants().durationTime
        //   我觉得， 复位用 6 分钟， 更好,  he he .                   与调用的 几个场景，不符合
        
        configureButtonsAndMenus()
    } // 这个 就 适用于， 在 perferences 中选了时间的情况下。           reset to default
    
/*
     You can use the Timer menu to control the app; try stopping, starting and resetting using the menu and the keyboard shortcuts.
     */

    
    
    // MARK: - IBActions - menus
    // 如果是 听歌， 就需要有 continue 和 pause 
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
        updateDisplay(0)
        playSound()
    }
    
    
    
    func timeRemaingOnTimer(_ timer: EggTimer, timeRemaining: TimeInterval) {
        updateDisplay(timeRemaining )
    }
    
    
    
}






extension SceneOneViewController{

    // MARK: - Display
    
    
    func updateDisplay(_ timeRemaining: TimeInterval){
        timeLeftField.stringValue = textToDisplay(timeRemaining)
        eggImageView.image = imageToDisplay(timeRemaining)
    }
    
    
    private func textToDisplay(_ timeRemaining: TimeInterval) -> String{
        if timeRemaining == 0{
            return "好啦"
        }
        
        let minutesRemaining = floor( timeRemaining / 60 )
        let secondsRemaining = timeRemaining - (minutesRemaining * 60)
        
        let secondsDisplay = String(format: "%02d", Int(secondsRemaining))
        let timeRemainingDisplay = "\(Int(minutesRemaining)): \(secondsDisplay)"
        
        return timeRemainingDisplay
    }
/*
     
     textToDisplay converts the seconds remaining to M:SS format. imageToDisplay calculates how much the egg is done as a percentage of the total and picks the image to MATCH.
     
     */
    
    
    
    
    private func imageToDisplay(_ timeRemaining: TimeInterval ) -> NSImage?{
        let perventageComplete = 100 - (timeRemaining / preferences_sceneOne.selectedTime * 100)
        
        //  kTimeConstants().durationTime
        
        if eggTimer.isStopped{
            let stoppedImageName = (timeRemaining == 0 ) ? "100" : "stopped"
            return NSImage(named: NSImage.Name( stoppedImageName ))
        }
        
        
        let imageName: String
        switch perventageComplete {
        case 0..<25:
            imageName = "0"
        case 25..<50:
            imageName = "25"
        case 50..<75:
            imageName = "50"
        case 75..<100:
            imageName = "75"
        default:
            imageName = "100"
        }
        
        return NSImage(named: NSImage.Name(rawValue: imageName))
    }
    
    
    
    //    控制 按钮 和 菜单栏 的 enable .
    func configureButtonsAndMenus(){
        let enableStart: Bool
        let enableStop: Bool
        let enableReset: Bool
        
        if eggTimer.isStopped {
            enableStart = true             //        true  , 觉得 已经 stopped , 再 点击 start ， 好像没有意义               //          false
            enableStop = false
            enableReset = false
            
        }
        else if eggTimer.isPaused{
            enableStart = true
            enableStop = false
            enableReset = true
        }
        else{
            enableStart = false
            enableStop = true
            enableReset = false
        }
        
        startButton.isEnabled = enableStart
        stopButton.isEnabled = enableStop
        resetButton.isEnabled = enableReset
        
        if let appDelegate = NSApplication.shared.delegate as? AppDelegate{
            appDelegate.enableMenus(start: enableStart, stop: enableStop, reset: enableReset)
        }
        
    }//     func configureButtonsAndMenus(){
    
    
}




extension SceneOneViewController{
    
    
    // MARK: - Preferences
    
    func setupPrefers(){
        updateDisplay(preferences_sceneOne.selectedTime )
        
        let notificationName = Notification.Name(kPreferenceNotificationName)
        NotificationCenter.default.addObserver(forName: notificationName, object: nil, queue: nil) { _ in
            //  self.updateFromPreferences()
            self.checkForResetAfterPreferenceChange()  // 改为 回话
        }
    }
    
    
    
    func updateFromPreferences(){
        self.eggTimer.duration = self.preferences_sceneOne.selectedTime
        self.resetButtonClicked(self)
        
    }
    // 这里有 resetButtonClicked
    // 这里有 复位按钮 的戏
    
}



extension SceneOneViewController{
    
    func checkForResetAfterPreferenceChange(){
        
        if eggTimer.isStopped || eggTimer.isPaused{
            updateFromPreferences()
        }
        else{
            // 弹框， 只有在 计时器 start && run 的情况下， 才显示
            
            let alert = NSAlert()
            alert.messageText = "Reset timer with the new settings?"
            alert.informativeText = "This will stop your current timer!"
            alert.alertStyle = .warning
            
            alert.addButton(withTitle: "Reset")
            alert.addButton(withTitle: "Cancel")
            
            let response = alert.runModal()  // 有意思， 放在 隔壁的 prefer 控制器， 似乎更加的合适
            if response == NSApplication.ModalResponse.alertFirstButtonReturn{
                self.updateFromPreferences()
            }
        }

    }//     Add 2 buttons: Reset & Cancel. They will appear from right to left in the order you add them and the first one will be the default.

    
    
    
    //  MARK:- Sound
    func prepareSound(){
        guard let audioFileUrl = Bundle.main.url(forResource: "ding", withExtension: "mp3")
            else {  return  }
        
        
        do {
            soundPlayer = try AVAudioPlayer(contentsOf: audioFileUrl )
            soundPlayer?.prepareToPlay()
        }
        catch{
            print("Sound player not available: \(error)")
        }
        
    }       //              func prepareSound(){
    
    
    func playSound(){
        soundPlayer?.play()
    }   //      func playSound(){
    
}


/*
 
 prepareSound is doing most of the work here - it first checks to see whether the ding.mp3 file is available in the APP bundle. If the file is there, it tries to initialize an AVAudioPlayer with the sound file URL and prepares it to play. This pre-buffers the sound file so it can play immediately when needed.
 
 
 playSound just sends a play message to the player if it exists, but if prepareSound has failed, soundPlayer will be nil so this will do nothing.

 
 */
