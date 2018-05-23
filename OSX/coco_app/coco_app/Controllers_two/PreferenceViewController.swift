//
//  PreferenceViewController.swift
//  coco_app
//
//  Created by dengjiangzhou on 2018/5/21.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import Cocoa


let kPreferenceNotificationName = "PrefsChanged"

let kPreferenceTitle = "Custom"

class PreferenceViewController: NSViewController {

    
    
    @IBOutlet weak var presetsPopup: NSPopUpButton!
    @IBOutlet weak var customSlider: NSSlider!
    @IBOutlet weak var customTextField: NSTextField!
    
    
    
    var preference_Preference = Preferences()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showExistingPrefers()
        
        
    }
    
    
    

    @IBAction func popupValueChanged(_ sender: NSPopUpButton) {
        
        if sender.selectedItem?.title == kPreferenceTitle{
            customSlider.isEnabled = true
            return
        }
        
        let newTimerDuration = sender.selectedTag()
        customSlider.integerValue = newTimerDuration
        showSliderValueAsText()
        customSlider.isEnabled = false
    }
    
    
    
    
    
    @IBAction func sliderValueChanged(_ sender: NSSlider) {
        showSliderValueAsText()
        
    }
    
    
    
    
    
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        view.window?.close()
        
        
    }
    
    
    
    
    
    @IBAction func okButtonClicked(_ sender: Any) {
        saveNewPrefers()
        view.window?.close()
    }

    
}





extension PreferenceViewController{
    
    
    func showExistingPrefers(){
        let selectedTimeInMinutes = Int( preference_Preference.selectedTime ) / 60
        
        presetsPopup.selectItem(withTitle: kPreferenceTitle )
        customSlider.isEnabled = true
        
        for item in presetsPopup.itemArray {
            if item.tag == selectedTimeInMinutes{
                presetsPopup.select(item )
                customSlider.isEnabled = false
                break
            }
        }
        
        customSlider.integerValue = selectedTimeInMinutes
        showSliderValueAsText()
    }
/*
     Loop through the menu items in the presetsPopup checking their tags. Remember in Part 2 how you set the tags to the number of minutes for each option? If a match is found, enable that item and get out of the loop.
     
     */

    
    
    func showSliderValueAsText(){
        let newTimerDuration = customSlider.integerValue
        let minutesDescription = (newTimerDuration == 1) ? "minute" : "minutes"
        customTextField.stringValue = "\(newTimerDuration) \(minutesDescription)"
        
    }
    
    
    
    func saveNewPrefers(){
        preference_Preference.selectedTime = customSlider.doubleValue * 60
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: kPreferenceNotificationName), object: nil )
        
    }
    
}


/*
 
 
 When the view loads, call the method that shows the preferences in the display. Remember, using the MVC pattern, the Preferences model object has no idea about how or when it might be displayed - that is for the PrefsViewController to manage.
 
 
 
 So now you have the ability to display the set time, but changing the time in the popup doesn't do anything yet. You need a method that saves the new data and tells anyone who is interested that the data has changed.
 
 
 
 In the EggTimer object, you used the delegate pattern to pass data to whatever needed it. This time (just to be different), you are going to broadcast a Notification when the data changes. Any object that choses can listen for this notification and act on it when received.
 
 
 
 */
