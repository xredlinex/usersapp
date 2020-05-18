//
//  UserGridCollectionViewCell.swift
//  usersapp
//
//  Created by alexey sorochan on 16.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import Kingfisher

class UserGridCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var userPictureBorderView: UIView!
    @IBOutlet weak var userPictureView: UIView!
    @IBOutlet weak var userPictureImageView: UIImageView!
    @IBOutlet weak var onlineStatusView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        userPictureImageView.image = nil
    }
    
    func updateGrdiCell(_ user: UserModel) {
        
        setupCellUi()
        
        if let url = URL(string: user.picture?.medium ?? "") {
            userPictureImageView.kf.setImage(with: url)
        }
        
        if !user.status {
            setupOnline()
        } else {
            setupOffline()
        }
    }
}

extension UserGridCollectionViewCell {
    
    func setupCellUi() {
        
        userPictureBorderView.clipsToBounds = true
        userPictureBorderView.layer.cornerRadius = userPictureBorderView.frame.width / 2
        userPictureBorderView.layer.borderWidth = 2
        userPictureView.clipsToBounds = true
        userPictureView.layer.cornerRadius = userPictureView.frame.width / 2
        onlineStatusView.clipsToBounds = true
        onlineStatusView.layer.cornerRadius = onlineStatusView.frame.width / 2
    }
}


extension UserGridCollectionViewCell {
    
    func setupOnline() {
        userPictureBorderView.layer.borderWidth = 1
        userPictureBorderView.layer.borderColor = UIColor.lightGray.cgColor
        onlineStatusView.layer.backgroundColor = UIColor.clear.cgColor
    }
    
    func setupOffline() {
        userPictureBorderView.layer.borderColor = UIColor.green.cgColor
        onlineStatusView.layer.backgroundColor = UIColor.green.cgColor
    }
}
