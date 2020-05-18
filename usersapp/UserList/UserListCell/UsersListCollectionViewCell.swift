//
//  UsersListCollectionViewCell.swift
//  usersapp
//
//  Created by alexey sorochan on 16.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import Kingfisher

class UsersListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var userPictureBorderView: UIView!
    @IBOutlet weak var userPictureImageView: UIImageView!
    @IBOutlet weak var userNameTextLabel: UILabel!
    @IBOutlet weak var userLastNameTextLabel: UILabel!
    @IBOutlet weak var onlineStatusView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCellUi()
    }
    
    func updateListCell(_ user: UserModel) {
        
        if let url = URL(string: user.picture?.medium ?? "") {
            userPictureImageView.kf.setImage(with: url)
        }
        userNameTextLabel.text = user.name?.first ?? ""
        userLastNameTextLabel.text = user.name?.last ?? ""
        
        if !user.status {
        setupOffline()
        } else {
            setupOnline()
        }
    }
}

extension UsersListCollectionViewCell {
    
    func setupCellUi() {
        cellView.userBlurCell()
        userPictureBorderView.clipsToBounds = true
        userPictureBorderView.layer.cornerRadius = userPictureBorderView.frame.width / 2
        userPictureBorderView.layer.borderWidth = 2
        userPictureImageView.layer.cornerRadius = userPictureImageView.frame.width / 2
        onlineStatusView.clipsToBounds = true
        onlineStatusView.layer.cornerRadius = onlineStatusView.frame.width / 2
    }
    
    func setupOnline() {
        userPictureBorderView.layer.borderColor = UIColor(red: 233/255, green: 80/255, blue: 38/255, alpha: 1).cgColor
        onlineStatusView.layer.backgroundColor = UIColor(red: 233/255, green: 80/255, blue: 38/255, alpha: 1).cgColor
    }
    
    func setupOffline() {
        userPictureBorderView.layer.borderColor = UIColor.clear.cgColor
        onlineStatusView.layer.backgroundColor = UIColor.clear.cgColor
    }
}

