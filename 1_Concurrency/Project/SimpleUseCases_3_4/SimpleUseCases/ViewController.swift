//
//  ViewController.swift
//  SimpleUseCases
//
//  Created by dengjiangzhou on 2018/7/13.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let userQueue = DispatchQueue.global(qos: .userInitiated)
    let defaultQueue = DispatchQueue.main
    
    let privateQueue = DispatchQueue(label: "com.deng.yi.lang", qos: .default, attributes: .concurrent )
    
    // Allow for random sleep times
    let sleepMax: UInt32 = 5
    
    let numberArray = [(0,1), (2,3), (4,5), (6,7), (8,9)]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("👌")
        
        // simple_use_cases()
        
        
        
        // so_called_groupOfSyncTasks()
        
       //  her_groupOfAsyncTasks()
        let aView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        aView.backgroundColor = UIColor.red
        self.view.addSubview(aView)
        let box = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        box.backgroundColor = UIColor.yellow
        aView.addSubview(box)
        
        
        let animationGroup = DispatchGroup()
        
        //  UIView.animate_deng
        
        UIView.animate(withDuration: 1, animations: {
            box.center = CGPoint(x: 150, y: 150)
        }, group: animationGroup) { _ in
            UIView.animate(withDuration: 2, animations: {
                box.transform = CGAffineTransform(rotationAngle: .pi/4)
            }, group: animationGroup, completion: .none)
        }
        UIView.animate(withDuration: 4, animations: {
            aView.backgroundColor = UIColor.blue
        }, group: animationGroup) { (_) in
            
        }

        //: This should only print once all the animations are complete
        animationGroup.notify(queue: DispatchQueue.main) {
            print("Animations Completed!")
        }
    }
    
    
    
    func her_groupOfAsyncTasks(){
        let wrappedGroup = DispatchGroup()
        for iValue in numberArray{
            asyncAdd_Group(iValue, runQueue: privateQueue, group: wrappedGroup, completionQueue: defaultQueue) { (result, error) in
                print("Result = \(result)")
                
            }
            
        }
        
        wrappedGroup.notify(queue: defaultQueue ){
            print("WRAPPED")
        }
    }
    
    
    
    
    func so_called_groupOfSyncTasks(){
        let slowGroup = DispatchGroup()
        
        for iValue in numberArray{
            privateQueue.async(group: slowGroup){
                if(iValue.0 == 1){
                    let dispatchResult = slowGroup.wait(timeout: DispatchTime.distantFuture)
                    print(dispatchResult)
                }
                let result = self.slowAdd(iValue)
                print("result = \(result)")
            }
            
        }
        slowGroup.notify(queue: defaultQueue){
            print("GCD Group Done!")
        }
        
        /*
         result = 17
         result = 5
         result = 1
         result = 13
         result = 9
         GCD Group Done!
         */
        
    }
    
    
    
    func asyncAdd_Group(_ input: (Int, Int), runQueue: DispatchQueue, group: DispatchGroup, completionQueue: DispatchQueue, completion: @escaping (Int, Error?) -> ()){
        group.enter()
        asyncAdd(input, runQueue: runQueue, completionQueue: completionQueue) { (result, error) in
            completion(result, error)
            group.leave()
        }
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}




extension UIView {
    // 我想多了
    static func animate_deng(withDuration duration: TimeInterval, animations: @escaping () -> Void, group: DispatchGroup, completion: ((Bool) -> Void)?) {
        
        // TODO: Fill in this implementation
        
        DispatchQueue.main.async(group: group){
            animations()
        }
        if completion != nil {
            DispatchQueue.main.async(group: group){
                completion!(true)
            }
        }
    }
    
    
    
    // 事实上， 就这么简单。
    static func animate(withDuration duration: TimeInterval, animations: @escaping () -> Void, group: DispatchGroup, completion: ((Bool) -> Void)?) {
        
        // TODO: Fill in this implementation
        group.enter()
   /*     UIView.animate(withDuration: duration, animations: animations,completion: completion)
        group.leave()
      错啦
    */
        UIView.animate(withDuration: duration, animations: animations){
            _ in
            group.leave()
        }
        // 时机很漂亮
        
    }

}
