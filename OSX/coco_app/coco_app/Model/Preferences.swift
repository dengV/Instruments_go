//
//  Preferences.swift
//  coco_app
//
//  Created by dengjiangzhou on 2018/5/23.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

/*
 
 Preferences is a struct, so it is value-based not reference-based. Each View Controller gets its own copy.
 
 The Preferences struct interacts with UserDefaults through a singleton, so both copies are using the same UserDefaults and getting the same data.
 
 */


import Foundation

let kSelectedTime = "selectedTime"

struct Preferences{
    
    var selectedTime: TimeInterval{
        
        get {
            
            let savedTime = UserDefaults.standard.double(forKey: kSelectedTime )
            if savedTime > 0 {
                return savedTime
            }
            return kTimeConstants().durationTime
            //      360
        }
        
        set{
            UserDefaults.standard.set(newValue, forKey: kSelectedTime )
            
        }
        
    }
    
    
    
    
    
}



/*
 
 
 //     let savedTime = UserDefaults.standard.double(forKey: kSelectedTime )
 
 
 When the value of the variable is requested, the UserDefaults singleton is asked for the Double value assigned to the key "selectedTime". If the value has not been defined, UserDefaults will return zero, but if the value is greater than 0, return that as the value of selectedTime.
 
 
 
 
 If selectedTime has not been defined, use the default value of 360 (6 minutes).
 
 
 
 
 
 
 //         set{
 
 
 Whenever the value of selectedTime is changed, write the new value to UserDefaults with the key "selectedTime".
 
 
 */
