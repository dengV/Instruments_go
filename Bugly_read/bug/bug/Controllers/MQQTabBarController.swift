//
//  MQQTabBarController.swift
//  bug
//
//  Created by dengjiangzhou on 2018/4/27.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import UIKit

class MQQTabBarController: UITabBarController {

    override func viewDidLoad() {
        print("\(type(of: self)) ,\(#function)")
        super.viewDidLoad()
        
        let tab1 = MQQTab1ViewController()
        tab1.title = "red"
        self.addChildViewController(tab1)
        
        let tab2 = MQQTab2ViewController()
        tab2.title = "blue"
        self.addChildViewController(tab2)
        
        let tab3 = MQQTab3ViewController()
        tab3.title = "green"
        self.addChildViewController(tab3)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
