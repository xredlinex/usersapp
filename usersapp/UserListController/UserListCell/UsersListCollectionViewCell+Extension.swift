//
//  UsersListCollectionViewCell+Extension.swift
//  usersapp
//
//  Created by alexey sorochan on 19.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

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
