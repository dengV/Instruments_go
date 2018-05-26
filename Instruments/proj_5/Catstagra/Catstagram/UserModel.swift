//
//  UserModel.swift
//  Catstagram-Starter
//
//  Created by Luke Parham on 2/12/17.
//  Copyright © 2017 Luke Parham. All rights reserved.
//

import Foundation

class UserModel {
//    let dictionaryRepresentation: [String: Any]
    let userID: Int?
    let username: String?
    let firstName: String?
    let lastName: String?
    let fullName: String?
    let city: String?
    let state: String?
    let country: String?
    let about: String?
    let domain: String?
    
    
    let userPicURL: URL?
    let photoCount: Int?
    let galleriesCount: Int?
    let affection: Int?
    let friendsCount: Int?
    let followersCount: Int?
    let following: Bool?

    init?(withDictionary dictionary:[String: Any]) {
        guard let userDictionary = dictionary["user"] as? [String: Any] else { return nil }
        
        userID = userDictionary["user"] as? Int
        
        if let username = userDictionary["username"] as? String {
            self.username = username
        } else {
            username = "Anonymous"
        }

        firstName = userDictionary["firstname"] as? String
        lastName = userDictionary["lastname"] as? String
        fullName = userDictionary["fullname"] as? String
        city = userDictionary["city"] as? String
        state = userDictionary["state"] as? String
        country = userDictionary["country"] as? String
        about = userDictionary["about"] as? String
        domain = userDictionary["domain"] as? String
        photoCount = userDictionary["photos_count"] as? Int

        galleriesCount = userDictionary["galleries_count"] as? Int
        affection = userDictionary["affection"] as? Int
        friendsCount = userDictionary["friends_count"] as? Int
        followersCount = userDictionary["followers_count"] as? Int
        following = userDictionary["following"] as? Bool
//        self.dictionaryRepresentation = userDictionary
        
        if let urlString = userDictionary["userpic_url"] as? String {
            userPicURL = URL(string: urlString)
        } else {
            userPicURL = nil
        }
    }

    func usernameAttributedString(withFontSize fontSize: CGFloat) -> NSAttributedString {
        return NSAttributedString(string: username, fontSize: fontSize, color: .darkBlue(), firstWordColor: nil)
    }

    func fullNameAttributedString(withFontSize fontSize: CGFloat) -> NSAttributedString {
        return NSAttributedString(string: fullName, fontSize: fontSize, color: .lightGray, firstWordColor: nil)
    }
    
    func fetchAvatarImage(withCompletion completion: (() -> Void)) {
        
    }
    
    func downloadUserData(withCompletion completion: (() -> Void)) {
        
    }
}
