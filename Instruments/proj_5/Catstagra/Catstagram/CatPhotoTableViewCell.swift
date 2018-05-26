
//
//  CatPhotoTableViewCell.swift
//  Catstagram-Starter
//
//  Created by Luke Parham on 2/12/17.
//  Copyright © 2017 Luke Parham. All rights reserved.
//

import UIKit

class CatPhotoTableViewCell: UITableViewCell {
    let userImageHeight:CGFloat = 30
    
    var photoModel: PhotoModel? = nil
    
    var userAvatarImageView: AsyncImageView
    var photoImageView: AsyncImageView
    
    var userNameLabel: UILabel
    var photoTimeIntervalSincePostLabel: UILabel
    var photoLikesLabel: UILabel
    var photoDescriptionLabel: UILabel
    
    var userNameYPositionWithPhotoLocation: NSLayoutConstraint
    var userNameYPositionWithoutPhotoLocation: NSLayoutConstraint
    var photoLocationYPosition: NSLayoutConstraint
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        userAvatarImageView = AsyncImageView()
        photoImageView      = AsyncImageView()
        
        userAvatarImageView.clipsToBounds = true
        photoImageView.clipsToBounds = true
        
        userNameLabel                   = UILabel()
        photoTimeIntervalSincePostLabel = UILabel()
        photoLikesLabel                 = UILabel()
        photoDescriptionLabel           = UILabel()
        
        userNameLabel.backgroundColor = .white
        photoTimeIntervalSincePostLabel.backgroundColor = .white
        photoLikesLabel.backgroundColor = .white
        photoDescriptionLabel.backgroundColor = .white
        
        userNameYPositionWithPhotoLocation    = NSLayoutConstraint()
        userNameYPositionWithoutPhotoLocation = NSLayoutConstraint()
        photoLocationYPosition                = NSLayoutConstraint()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(userAvatarImageView)
        addSubview(photoImageView)
        addSubview(userNameLabel)
        addSubview(photoTimeIntervalSincePostLabel)
        addSubview(photoLikesLabel)
        addSubview(photoDescriptionLabel)
        
        userAvatarImageView.backgroundColor = .white
        photoImageView.backgroundColor = .lightGray
        photoImageView.contentMode = .scaleAspectFill
        
        userAvatarImageView.layer.cornerRadius = userImageHeight/2.0
        userAvatarImageView.clipsToBounds = true
        
        userAvatarImageView.translatesAutoresizingMaskIntoConstraints             = false
        photoImageView.translatesAutoresizingMaskIntoConstraints                  = false
        userNameLabel.translatesAutoresizingMaskIntoConstraints                   = false
        photoTimeIntervalSincePostLabel.translatesAutoresizingMaskIntoConstraints = false
        photoLikesLabel.translatesAutoresizingMaskIntoConstraints                 = false
        photoDescriptionLabel.translatesAutoresizingMaskIntoConstraints           = false
        
        setupConstraints()
        updateConstraints()
    }
    
    class func height(forPhoto photoModel: PhotoModel, with width: CGFloat) -> CGFloat {
        let headerHeight:CGFloat = 50.0
        let horizontalBuffer:CGFloat = 10.0
        let verticalBuffer:CGFloat = 5.0
        let fontSize:CGFloat = 14.0

        let photoHeight = width
        
        let font = UIFont.systemFont(ofSize: 14)
        
        let descriptionAttrString = photoModel.descriptionAttributedString(withFontSize: fontSize)
        let availableWidth = width - (horizontalBuffer * 2);
        
        let descriptionHeight = descriptionAttrString.boundingRect(with: CGSize(width: availableWidth, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, context: nil).size.height
        let commentViewHeight = CommentView.height(forCommentFeed: photoModel.commentFeed, withWidth: availableWidth)
        
        return headerHeight + photoHeight + font.lineHeight + descriptionHeight + commentViewHeight + (4 * verticalBuffer)
    }
    
    func addShadows() {
        for view in [photoDescriptionLabel, userNameLabel] {
            let shadow = NSShadow()
            shadow.shadowColor = UIColor.lightGray
            shadow.shadowOffset = CGSize(width: 0.0, height: 5.0)
            shadow.shadowBlurRadius = 5.0
            
            if let mutableAttributedString = view.attributedText as? NSMutableAttributedString {
                let range = NSRange(location: 0, length: mutableAttributedString.string.count)
                
                mutableAttributedString.addAttribute(NSShadowAttributeName, value: shadow, range: range)
            }
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        clearImages()
        
        userNameLabel.attributedText                   = nil
        photoTimeIntervalSincePostLabel.attributedText = nil
        photoLikesLabel.attributedText                 = nil
        photoDescriptionLabel.attributedText           = nil
    }
    
    func clearImages() {
        userAvatarImageView.layer.contents = nil
        photoImageView.layer.contents = nil
    }
    
    func updateCell(with photo: PhotoModel?) {
        photoModel = photo
        
        guard let photoModel = photoModel else { return }
        
        userNameLabel.attributedText = photoModel.ownerUserProfile?.usernameAttributedString(withFontSize: 14.0)
        photoTimeIntervalSincePostLabel.attributedText = photoModel.uploadDateAttributedString(withFontSize: 14.0)
        photoLikesLabel.attributedText = photoModel.likesAttributedString(withFontSize: 14.0)
        photoDescriptionLabel.attributedText = photoModel.descriptionAttributedString(withFontSize: 14.0)

        addShadows()

        userNameLabel.sizeToFit()
        photoTimeIntervalSincePostLabel.sizeToFit()
        photoLikesLabel.sizeToFit()
        photoDescriptionLabel.sizeToFit()

        var rect = photoDescriptionLabel.frame
        let availableWidth = bounds.size.width - 20
        rect.size = photoDescriptionLabel.sizeThatFits(CGSize(width: availableWidth, height: CGFloat.greatestFiniteMagnitude))
            
        photoDescriptionLabel.frame = rect
        UIImage.downloadImage(for: photoModel.url) { (image) in
            if self.photoModel == photo {
                self.photoImageView.image = image
            }
        }
        downloadAndProcessUserAvatar(forPhoto: photoModel)
    }
    
    func placeholderAvatar() -> UIImage {
        return UIImage(named: "placeholder")!.makeCircularImage(with: CGSize(width: userImageHeight, height: userImageHeight))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photoImageView.layer.cornerRadius = 2.0
    }

    func downloadAndProcessUserAvatar(forPhoto photoModel: PhotoModel) {
        UIImage.downloadImage(for: photoModel.url) { (image) in
            if self.photoModel == photoModel, let image = image {
                let size = CGSize(width: self.userImageHeight, height: self.userImageHeight)
                self.userAvatarImageView.image = image//.makeCircularImage(with: size)
            }
        }
    }
}

// MARK: - CatPhotoTableViewCell
extension CatPhotoTableViewCell {
    func setupConstraints() {
        addConstraintsForAvatar()
        addConstraintsForUserNameLabel()
        addConstraintsForPhotoTimeIntervalSincePostLabel()
        addConstraintsForPhotoImageView()
        addConstraintsForLikesLabel()
        addConstraintsForDescriptionLabel()
    }
    
    func addConstraintsForAvatar() {
        let horizontalBuffer:CGFloat = 10.0
        
        addConstraint(NSLayoutConstraint(item: userAvatarImageView, attribute: .left, relatedBy: .equal, toItem: userAvatarImageView.superview, attribute: .left, multiplier: 1.0, constant: horizontalBuffer))
        addConstraint(NSLayoutConstraint(item: userAvatarImageView, attribute: .top, relatedBy: .equal, toItem: userAvatarImageView.superview, attribute: .top, multiplier: 1.0, constant: horizontalBuffer))
        addConstraint(NSLayoutConstraint(item: userAvatarImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0.0, constant: userImageHeight))
        addConstraint(NSLayoutConstraint(item: userAvatarImageView, attribute: .height, relatedBy: .equal, toItem: userAvatarImageView, attribute: .width, multiplier: 1.0, constant: 0.0))
    }
    
    func addConstraintsForUserNameLabel() {
        let horizontalBuffer:CGFloat = 10.0

        addConstraint(NSLayoutConstraint(item: userNameLabel, attribute: .left, relatedBy: .equal, toItem: userAvatarImageView, attribute: .right, multiplier: 1.0, constant: horizontalBuffer))
        addConstraint(NSLayoutConstraint(item: userNameLabel, attribute: .right, relatedBy: .lessThanOrEqual, toItem: photoTimeIntervalSincePostLabel, attribute: .left, multiplier: 1.0, constant: -horizontalBuffer))
        
        userNameYPositionWithoutPhotoLocation = NSLayoutConstraint(item: userNameLabel, attribute: .centerY, relatedBy: .equal, toItem: userAvatarImageView, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        addConstraint(userNameYPositionWithoutPhotoLocation)
        
        userNameYPositionWithPhotoLocation = NSLayoutConstraint(item: userNameLabel, attribute: .top, relatedBy: .equal, toItem: userAvatarImageView, attribute: .top, multiplier: 1.0, constant: -2.0)
        userNameYPositionWithPhotoLocation.isActive = false
        addConstraint(userNameYPositionWithPhotoLocation)
    }
    
    func addConstraintsForPhotoTimeIntervalSincePostLabel() {
        let horizontalBuffer:CGFloat = 10.0

        addConstraint(NSLayoutConstraint(item: photoTimeIntervalSincePostLabel, attribute: .right, relatedBy: .equal, toItem: photoTimeIntervalSincePostLabel.superview, attribute: .right, multiplier: 1.0, constant: -horizontalBuffer))
        addConstraint(NSLayoutConstraint(item: photoTimeIntervalSincePostLabel, attribute: .centerY, relatedBy: .equal, toItem: userAvatarImageView, attribute: .centerY, multiplier: 1.0, constant: 0.0))
    }
    
    func addConstraintsForPhotoImageView() {
        let headerHeight:CGFloat = 50.0

        addConstraint(NSLayoutConstraint(item: photoImageView, attribute: .top, relatedBy: .equal, toItem: photoImageView.superview, attribute: .top, multiplier: 1.0, constant: headerHeight))
        addConstraint(NSLayoutConstraint(item: photoImageView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1.0, constant: 0.0))
        addConstraint(NSLayoutConstraint(item: photoImageView, attribute: .height, relatedBy: .equal, toItem: photoImageView, attribute: .width, multiplier: 1.0, constant: 0.0))
    }
    
    func addConstraintsForLikesLabel() {
        let verticalBuffer:CGFloat = 5.0
        let horizontalBuffer:CGFloat = 10.0

        addConstraint(NSLayoutConstraint(item: photoLikesLabel, attribute: .top, relatedBy: .equal, toItem: photoImageView, attribute: .bottom, multiplier: 1.0, constant: verticalBuffer))

        addConstraint(NSLayoutConstraint(item: photoLikesLabel, attribute: .left, relatedBy: .equal, toItem: photoLikesLabel.superview, attribute: .left, multiplier: 1.0, constant: horizontalBuffer))
    }
    
    func addConstraintsForDescriptionLabel() {
        let verticalBuffer:CGFloat = 5.0
        let horizontalBuffer:CGFloat = 10.0

        addConstraint(NSLayoutConstraint(item: photoDescriptionLabel, attribute: .top, relatedBy: .equal, toItem: photoLikesLabel, attribute: .bottom, multiplier: 1.0, constant: verticalBuffer))
        addConstraint(NSLayoutConstraint(item: photoDescriptionLabel, attribute: .left, relatedBy: .equal, toItem: photoDescriptionLabel.superview, attribute: .left, multiplier: 1.0, constant: horizontalBuffer))
        addConstraint(NSLayoutConstraint(item: photoDescriptionLabel, attribute: .width, relatedBy: .equal, toItem: photoDescriptionLabel.superview, attribute: .width, multiplier: 1.0, constant: -horizontalBuffer))
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
//        userNameYPositionWithoutPhotoLocation.isActive = true
//        userNameYPositionWithPhotoLocation.isActive = false
        photoLocationYPosition.isActive = false
    }
}
