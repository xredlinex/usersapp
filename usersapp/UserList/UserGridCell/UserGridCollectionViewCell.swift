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
    
    @IBOutlet weak var mainView: UIView!
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
        
        mainView.clipsToBounds = true
        mainView.layer.cornerRadius = mainView.frame.width / 2
        mainView.isOpaque = true
        mainView.layer.masksToBounds = false
        mainView.layer.shadowColor = UIColor.black.cgColor
        mainView.layer.shadowOpacity = 0.5
        mainView.layer.shadowOffset = CGSize(width: 5, height: 5)
        mainView.layer.shadowRadius = 6
        
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
        userPictureBorderView.layer.borderColor = UIColor(red: 233/255, green: 80/255, blue: 38/255, alpha: 1).cgColor
        onlineStatusView.layer.backgroundColor = UIColor(red: 233/255, green: 80/255, blue: 38/255, alpha: 1).cgColor
    }
}
