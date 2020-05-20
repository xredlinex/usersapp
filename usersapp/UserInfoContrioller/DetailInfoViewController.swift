//
//  DetailInfoViewController.swift
//  usersapp
//
//  Created by alexey sorochan on 19.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//


import UIKit
import FlagKit


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
    @IBOutlet weak var userLoginNameTextLabel: UILabel!
    @IBOutlet weak var userEmailTextField: UILabel!
    @IBOutlet weak var userPhoneNumber: UILabel!
    @IBOutlet weak var userDateOfBirthTextLabel: UILabel!
    @IBOutlet weak var userLocationAddressTextLabel: UILabel!
    @IBOutlet weak var nationalityImageView: UIImageView!
    @IBOutlet weak var natioonalityTextLabel: UILabel!
    
    
    var user: UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let userInfo = user {
            updateUserInfo(userInfo)
            setupBackground(status: userInfo.status)
        } else {
            navigationController?.popViewController(animated: false)
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
        
        guard let state = user.location?.state, let city = user.location?.city, let street = user.location?.street?.name, let numberStreet = user.location?.street?.number else { return }
        if let userPictureUrl = URL(string: user.picture?.large ?? "") {
            userPictureImageView.kf.setImage(with: userPictureUrl)
        }
        userNameTextLabel.text = "\(user.name?.first ?? "") \(user.name?.last ?? "")"
        userLocationTextLabel.text = "\(city), \(state)"
        userOnlineStatusTextLabel.text = user.status ? "online" : "offline"
        userLoginNameTextLabel.text = user.login?.username ?? ""
        userEmailTextField.text = user.email ?? ""
        userPhoneNumber.text = user.phone ?? ""
        userDateOfBirthTextLabel.text = convertDate(user.dob?.date ?? "")
        userLocationAddressTextLabel.text = "\(numberStreet) \(street), \(city)"
        
        let flag = Flag(countryCode: user.nat)
        nationalityImageView.image = flag?.image(style: .circle)
        
        if let nationality = (Locale.current as NSLocale).displayName(forKey: .countryCode, value: user.nat) {
            natioonalityTextLabel.text = nationality
        } else {
            natioonalityTextLabel.text = ""
        }
        
        
        
    }
}



