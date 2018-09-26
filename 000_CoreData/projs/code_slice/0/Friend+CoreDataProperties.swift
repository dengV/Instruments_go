//
//  Friend+CoreDataProperties.swift
//  PetPal
//
//  Created by dengjiangzhou on 2018/9/17.
//  Copyright © 2018年 Razeware. All rights reserved.
//
//

import Foundation
import CoreData


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var name: String?
    @NSManaged public var address: String?

}


// Core Data Properties is generated ,

//  every time you regenerate your NSManagedObjectsSubclasses



// So essentially, you do not want to put any code in here.



// you want to put your custom code in here.





