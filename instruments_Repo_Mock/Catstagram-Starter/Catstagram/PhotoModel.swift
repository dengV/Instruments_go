//
//  PhotoModel.swift
//  Catstagram-Starter
//
//  Created by Luke Parham on 2/12/17.
//  Copyright © 2017 Luke Parham. All rights reserved.
//

import Foundation

class PhotoModel: NSObject {
    var url: URL?
    var photoID: Int?
    var uploadDateString: String?
    var title: String?
    var descriptionText: String?
    var commentsCount: UInt?
    var likesCount: UInt?
    
    var ownerUserProfile: UserModel?

    init(photoDictionary: [String: Any]) {
        //if let urlStringArray = photoDictionary["image_url"] as? Array{}
        //  就报错， Ambiguous reference to member 'subscript'
        
      
        if let urlStringArray = photoDictionary["image_url"] as? [String]{
            let urlString = urlStringArray.first!
            url              = URL(string: urlString)
        }
        
  //  https://stackoverflow.com/questions/34995173/swift-error-ambiguous-reference-to-member-subscript
        
        photoID          = photoDictionary["id"] as? Int
        title            = photoDictionary["title"] as? String
        descriptionText  = photoDictionary["name"] as? String
        commentsCount    = photoDictionary["comments_count"] as? UInt
        likesCount       = photoDictionary["positive_votes_count"] as? UInt
        uploadDateString = "13h"
        
        ownerUserProfile = UserModel(withDictionary: photoDictionary)
    }
    
    func descriptionAttributedString(withFontSize size: CGFloat) -> NSAttributedString {
        guard let username = ownerUserProfile?.username, let descriptionText = descriptionText else { return NSAttributedString() }
        return NSAttributedString(string: "\(username) \(descriptionText)", fontSize: CGFloat(size), color: UIColor.darkGray, firstWordColor: UIColor.darkBlue())
    }
    
    func uploadDateAttributedString(withFontSize size: Float) -> NSAttributedString {
        return NSAttributedString(string: uploadDateString, fontSize: CGFloat(size), color: UIColor.lightGray, firstWordColor: nil)
    }
    
    func likesAttributedString(withFontSize size: Float) -> NSAttributedString {
        guard let likesCount = likesCount else { return NSAttributedString() }
        return NSAttributedString(string: "\(likesCount) likes", fontSize: CGFloat(size), color: UIColor.darkBlue(), firstWordColor: nil)
    }
}




/*
 
 
 附加资料:
 
 
 [WP] Where to get 500px Consumer Key?
 
 
 To get 500px consumer key login to your 500px acount and go to Acount > Applications.
 
 If you don't have registered app, you need to click on "Register Your Application" green button, and entered details.
 
 
 
 
 
 */




/*
 
 
 After you register your app click on "See application details" and copy your Consumer Key.
 */





/*
 
 
 http://help.dimsemenov.com/kb/wordpress-royalslider-tutorials/wp-where-to-get-500px-consumer-key
 */
