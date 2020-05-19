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
    @IBOutlet weak var userOnlineShadowView: UIView!
    
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
        userNetworkStatus(status: user.status)
    }
}

extension DetailInfoViewController {
    
    func userNetworkStatus(status: Bool) {
        
        let colorBorderOne = UIColor(red: 233/255, green: 80/255, blue: 38/255, alpha: 1).cgColor
        let colorBorderTwo = UIColor(red: 229/255, green: 60/255, blue: 57/255, alpha: 1).cgColor
        let colorBorderThree = UIColor(red: 229/255, green: 116/255, blue: 57/255, alpha: 1).cgColor
        
        if !status {
            userOnlineStatusView.userBlurCell()
        } else {
            userOnlineStatusView.viewStatusView(colors: [colorBorderOne, colorBorderTwo, colorBorderThree])
            userOnlineShadowView.viewShadowView()
        }
    }
}
