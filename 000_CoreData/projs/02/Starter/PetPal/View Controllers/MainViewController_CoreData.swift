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
        
        let request = Friend.fetchRequest() as NSFetchRequest<Friend>
    
        
        let sort = NSSortDescriptor(keyPath: \Friend.name, ascending: true)
        
        //  NSSortDescriptor(keyPath: \Friend.name, ascending: true)
        //  好独特的语法,  别致
        
        request.sortDescriptors = [sort]
        
        
        
        
        do {
            friends = try context.fetch(request)
        }catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        
    }
    
    
    
}
