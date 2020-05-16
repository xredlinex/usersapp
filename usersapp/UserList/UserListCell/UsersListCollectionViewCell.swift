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
    @IBOutlet weak var avatarView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userNameTextLabel: UILabel!
    @IBOutlet weak var userLastNameTextLabel: UILabel!
    @IBOutlet weak var userMailTextLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func updateListCell(_ user: UserModel) {
        
        if let url = URL(string: user.picture?.medium ?? "") {
            avatarImageView.kf.setImage(with: url)
        }
        
        userNameTextLabel.text = user.name?.first ?? ""
        userLastNameTextLabel.text = user.name?.last ?? ""
        userMailTextLabel.text = user.email
        
//        let random = Bool.random()
//        debugPrint(random)
        
        
        
        avatarView.clipsToBounds = true
        avatarView.layer.cornerRadius = avatarView.frame.width / 2
        
        
        
        
    }
}
