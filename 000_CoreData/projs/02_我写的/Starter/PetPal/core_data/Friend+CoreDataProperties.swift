//
//  Friend+CoreDataProperties.swift
//  PetPal
//
//  Created by dengjiangzhou on 2018/9/19.
//  Copyright © 2018年 Razeware. All rights reserved.
//
//

import Foundation
import CoreData


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var address: String?
    @NSManaged public var dob: Date?
    @NSManaged public var eyeColor: NSObject?
    @NSManaged public var name: String?
    @NSManaged public var photo: NSData?

}
