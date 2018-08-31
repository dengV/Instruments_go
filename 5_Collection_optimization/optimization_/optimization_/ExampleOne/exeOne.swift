//
//  exeOne.swift
//  optimization_
//
//  Created by dengjiangzhou on 2018/7/4.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import Foundation



func exe_O_O_O(){
    print("\((0..<20).shuffled())\n\n")
    print("\((0..<20).shuffled())\n\n")
    
    print("\((0..<20).shuffled())\n\n")
}



func exe_O_O(){
    var a = [2, 3, 4]
    let b = a
    
    a.insert(1, at: 0)
    
    print("a is \(a)\n\n")
    print("b is \(b)\n\n")
}
