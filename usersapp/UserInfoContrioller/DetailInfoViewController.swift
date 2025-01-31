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
    
    @IBOutlet weak var mainScrollView: UIScrollView!
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
    @IBOutlet weak var userNameScaleScrollTopContreaint: NSLayoutConstraint!
    
    var user: UserModel?
    var errorTextMsg = AlertErrors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let userInfo = user {
            updateUserInfo(userInfo)
            setupBackground(status: userInfo.status)
        } else {
            navigationController?.popViewController(animated: false)
        }
        
        self.mainScrollView.delegate = self
        
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
        if let status = user?.status, status != false {
            if let number = user?.cell {
                sendMessage(number)
            } else {
                showAlert(message: errorTextMsg.errorKey(error: .noCell))
            }
        } else {
            showAlert(message: errorTextMsg.errorKey(error: .userOffline))
        }
    }
    
    @IBAction func didTapSendMailActionButton(_ sender: Any) {
        if let mail = user?.email {
            sendMail(mail)
        } else {
            showAlert(message: errorTextMsg.errorKey(error: .noEmail))
        }
    }
    
    @IBAction func didTapMakeCallActionButton(_ sender: Any) {
        if let userNumber = user?.cell {
            makeCall(userNumber)
        } else {
            showAlert(message: errorTextMsg.errorKey(error: .noCell))
        }
    }
}

