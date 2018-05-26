//
//  CoolLogger.swift
//  Catstagram-Starter
//
//  Created by Luke Parham on 4/13/17.
//  Copyright © 2017 Luke Parham. All rights reserved.
//

import UIKit

class CoolLogger: NSObject {
    class func reportLogs() {
        print("<------Loggging-------->")
        
        //stop judging me.
        var now = CACurrentMediaTime()
        let threeSecondsLater = now + 3
        var a = 0
        while now < threeSecondsLater {
            a += 1
            now = CACurrentMediaTime()
        }
        if a > 2 {
            print("<------No crash detected.-------->")
            print("<------All systems are a go.-------->")
        }
    }
}
