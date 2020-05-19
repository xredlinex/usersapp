//
//  DetailInfoViewController.swift
//  usersapp
//
//  Created by alexey sorochan on 19.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class DetailInfoViewController: UIViewController {
    
    @IBOutlet weak var userPictureBorderView: UIView!
    @IBOutlet weak var userPictureFrameView: UIView!
    @IBOutlet weak var userPictureImageView: UIImageView!
    @IBOutlet weak var userNameTextLabel: UILabel!
    @IBOutlet weak var userLocationTextLabel: UILabel!
    
    var user: UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBackground()
        
        if let userInfo = user {
            updateUserInfo(userInfo)
        }
    }
    
    @IBAction func didTapBackActionButton(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
    @IBAction func didTapSendMessageActionButton(_ sender: Any) {
        if let number = user?.cell {
            sendMessage(number)
        }
    }
}

extension DetailInfoViewController {
    
    func updateUserInfo(_ user: UserModel) {
        
        if let userPictureUrl = URL(string: user.picture?.large ?? "") {
            userPictureImageView.kf.setImage(with: userPictureUrl)
        }
        userNameTextLabel.text = "\(user.name?.first ?? "") \(user.name?.last ?? "")"
        userLocationTextLabel.text = "\(user.location?.city ?? ""), \(user.location?.state ?? "")"
    }
}
