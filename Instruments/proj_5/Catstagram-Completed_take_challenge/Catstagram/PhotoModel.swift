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
    
    var location: LocationModel?
    var ownerUserProfile: UserModel?
    var commentFeed: CommentFeedModel

    init(photoDictionary: [String: Any]) {
        var urlString = ""
        if let urls = photoDictionary["images"] as? NSArray, let urlDict = urls.firstObject as? NSDictionary, let url = urlDict["url"] as? String {
            urlString = url
        }

        url              = URL(string: urlString)
        uploadDateString = photoDictionary["created_at"] as? String
        photoID          = photoDictionary["id"] as? Int
        title            = photoDictionary["title"] as? String
        descriptionText  = photoDictionary["name"] as? String
        commentsCount    = photoDictionary["comments_count"] as? UInt
        likesCount       = photoDictionary["positive_votes_count"] as? UInt
        uploadDateString = "13h"
        
        location         = LocationModel(photoDictionary: photoDictionary)
        commentFeed      = CommentFeedModel(photoID: photoID!)
        ownerUserProfile = UserModel(withDictionary: photoDictionary)
    }
    
    func descriptionAttributedString(withFontSize size: CGFloat) -> NSAttributedString {
        guard let username = ownerUserProfile?.username, let descriptionText = descriptionText else { return NSAttributedString() }
        return NSAttributedString(string: "\(username) \(descriptionText)", fontSize: CGFloat(size), color: .darkGray, firstWordColor: .darkBlue())
    }
    
    func uploadDateAttributedString(withFontSize size: Float) -> NSAttributedString {
        return NSAttributedString(string: uploadDateString, fontSize: CGFloat(size), color: .lightGray, firstWordColor: nil)
    }
    
    func likesAttributedString(withFontSize size: Float) -> NSAttributedString {
        guard let likesCount = likesCount else { return NSAttributedString() }
        return NSAttributedString(string: "\(likesCount) likes", fontSize: CGFloat(size), color: .darkBlue(), firstWordColor: nil)
    }
    
    func locationAttributedString(withFontSize size: Float) -> NSAttributedString {
        guard let locationString = location?.locationString else { return NSAttributedString() }
        return NSAttributedString(string: "\(locationString)", fontSize: CGFloat(size), color: .darkGray, firstWordColor: .darkBlue())
    }
}
