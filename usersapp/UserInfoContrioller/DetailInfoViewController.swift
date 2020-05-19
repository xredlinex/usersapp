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
    @IBOutlet weak var userInfoView: UIView!
    @IBOutlet weak var userOnlineStatusView: UIView!
    @IBOutlet weak var userOnlineStatusTextLabel: UILabel!
    
    var user: UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBackground()
        
        if let userInfo = user {
            updateUserInfo(userInfo)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        userInfoView.cornerRadiusView(corners: [.topLeft, .topRight], radius: 20)
        
        let gradientLayers = self.view.layer.sublayers?.compactMap { $0 as? CAGradientLayer }
        gradientLayers?.first?.frame = self.view.bounds
        
        userOnlineStatusView.viewStatusView(colors: [UIColor.red.cgColor, UIColor.yellow.cgColor])
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
        
        userOnlineStatusTextLabel.text = user.status ? "online" : "offline"
        
        
        
    }
}


extension DetailInfoViewController {
    
    func userOnlineStatus(userStatus: Bool) {
        
        if !userStatus {
            
            userOnlineStatusView.setupBackGroundGradient([UIColor.black.cgColor, UIColor.gray.cgColor])
            
            
        } else {
            userOnlineStatusView.setupBackGroundGradient([UIColor.red.cgColor, UIColor.yellow.cgColor])
        }
    }
}
