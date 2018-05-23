//
//  EggTimer.swift
//  coco_app
//
//  Created by dengjiangzhou on 2018/5/22.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import Foundation

protocol EggTimerProtocol {
    func timeRemaingOnTimer( _ timer: EggTimer , timeRemaining: TimeInterval )
    func timerHasFinished( _ timer: EggTimer )
}

struct kTimeConstants{
    let durationTime: Double = 360              // default = 6 minutes
    //      6
}


class EggTimer{
    
    var timer: Timer? = nil
    var startTime: Date?
    
    var duration: TimeInterval = kTimeConstants().durationTime        // default = 6 minutes
    var elapsedTime : TimeInterval = 0
    
    
    var isStopped : Bool{
        return timer == nil && elapsedTime == 0
        //  应该加一下， if isStopped == true
    }
    
    
    var isPaused: Bool{
        return timer == nil && elapsedTime > 0
    }
    
    var delegate: EggTimerProtocol?
    
    //      有 bug , stopped 了， 无法 继续
    @objc dynamic func timerAction(){
        // 这个方法，就是为了调用， 那两条代理方法
        guard let startTime = startTime else{
            return
        }
        
        elapsedTime = -startTime.timeIntervalSinceNow
        
        let secondsRemaining = (duration - elapsedTime).rounded()
        print("secondsRemaining is \(secondsRemaining)")
        if secondsRemaining <= 0{
            resetTimer()
            delegate?.timerHasFinished(self)
        }
        else{
            delegate?.timeRemaingOnTimer(self, timeRemaining: secondsRemaining)
        }
    }
/*
     If the timer has finished, reset it and tell the delegate it has finished. Otherwise, tell the delegate the number of seconds remaining. As delegate is an optional property, the ? is used to perform optional chaining. If the delegate is not set, these methods will not be called but nothing bad will happen.
     
     
     nil 对象，调用方法， 没啥事。
     */
    
    
    
    
    func timerStartsToFire(){
        startTime = Date()
        elapsedTime = 0
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(timerAction)), userInfo: nil, repeats: true)
        timerAction()
    }
    
    
    
    func resumeTimer(){
        startTime = Date(timeIntervalSinceNow: -elapsedTime)
        
        //  timer = Timer(timeInterval: 1, target: self, selector: (#selector(timerAction)), userInfo: nil, repeats: true)
        // 悲剧啊， 我看错了
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(timerAction)), userInfo: nil, repeats: true)
        timerAction()
    }
    
    
    func stopTimer(){
        timer?.invalidate()
        timer = nil
        timerAction()
        
    }
    
    
    
    func resetTimer(){
        timer?.invalidate()
        timer = nil
        startTime = nil
        duration = kTimeConstants().durationTime
        elapsedTime = 0
        
        
        timerAction()
        // 这行纯属多余
        
    }
    
}



/*
 
 A protocol sets out a contract and any object that is defined as conforming to the EggTimerProtocol must supply these 2 functions.
 
 
 Now that you have defined a protocol, the EggTimer can get an optional delegate property which is set to any object that conforms to this protocol. EggTimer does not know or care what type of object the delegate is, because it is certain that the delegate has those two functions.
 
 
 
 */
