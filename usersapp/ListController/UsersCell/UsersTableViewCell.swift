//
//  UsersTableViewCell.swift
//  usersapp
//
//  Created by alexey sorochan on 15.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import Kingfisher

class UsersTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameTextyLabel: UILabel!
    
    @IBOutlet weak var lastNameTextLabel: UILabel!
    
    @IBOutlet weak var mailtextLabel: UILabel!
    
    @IBOutlet weak var userImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func updateUserCell(_ user: UserModel) {
        debugPrint(user.picture?.large)
        nameTextyLabel.text = user.name?.first
        lastNameTextLabel.text = user.name?.last
        mailtextLabel.text = user.email
        
        if let imgUrl = user.picture?.medium {
            if let url = URL(string: imgUrl) {
                userImageView.kf.setImage(with: url)
            }
        }
        
        
        
    }
}


