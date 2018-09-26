//
//  MainViewController_CoreData.swift
//  PetPal
//
//  Created by dengjiangzhou on 2018/9/19.
//  Copyright © 2018年 Razeware. All rights reserved.
//

import Foundation

import CoreData



extension MainViewController{
    
    
    func refresh(){
        //  Core Data prvides a sort mechanism
        let request = Friend.fetchRequest() as NSFetchRequest<Friend>
    
        
        // 大小写，不敏感的写法
        let sort = NSSortDescriptor(key: #keyPath(Friend.name), ascending: true, selector: #selector(NSString.caseInsensitiveCompare(_:)))
        //  非常的漂亮， 不同于 下面 Swift 4 的语法
        
        
        // 大小写，敏感的写法
        // let sort = NSSortDescriptor(keyPath: \Friend.name, ascending: true)
        // indicate what the predicate for the fetch data should be.
        // let the request know what the sort order should be.
        
        
        
        
        
        //  NSSortDescriptor(keyPath: \Friend.name, ascending: true)
        //  好独特的语法,  别致
        //  使用 keypath, 放入一个 反斜杠 '\', backslash, and this indicates that 在添加 keypath
        
        
        
        request.sortDescriptors = [sort]
        
        // 就是修改 fetch request 的 sort 描述符（ 叙词 ） 属性。
        // 这是一个数组
        // can sort by multiple properties.
        
        
        
        do {
            friends = try context.fetch(request)
        }catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        
    }
    
    //  NSFetchRequest is represented by the NSFetchRequest class,
    //  and it is quite versatile
    
}





