//
//  ViewController.swift
//  Async_2_TiltShift
//
//  Created by dengjiangzhou on 2018/7/13.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    let workerQueue = DispatchQueue(label: "com.dng.big")
    let resultQueue = DispatchQueue.main
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image = UIImage(named: "dark_road_small.jpg")
        imageView.contentMode = .scaleAspectFit
        
         code_default(image!)
        
        
       // asyncTiltShift(image!)
        
        
        
        
    }

    
    
    func asyncTiltShift(_ image: UIImage){
        let interval = duration {
            workerQueue.async {
                
                let result = tiltShift(image: image)
                self.resultQueue.async {
                    self.imageView.image = result
                }
            }
            // 尼玛的 是个 串行
        }
        
        print("interval: \(interval)")
    }// interval: 4.10079956054688e-05, 效果相当好
    
    
    
    
    func code_default(_ image: UIImage){
        let interval = duration {
            let result = tiltShift(image: image)
            
            imageView.image = result
        }
        
        print("interval: \(interval)")
    }// interval: 1.12758302688599
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

