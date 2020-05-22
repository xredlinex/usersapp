//
//  DetailInfoViewController+Extension.swift
//  usersapp
//
//  Created by alexey sorochan on 19.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import MessageUI
import FlagKit

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

extension DetailInfoViewController {
    
    func setupBackground(status: Bool) {
        
        let colorBackgroundOne = UIColor(red: 95/255, green: 96/255, blue: 100/255, alpha: 1).cgColor
        let colorBackgroundTwo = UIColor(red: 40/255, green: 41/255, blue: 45/255, alpha: 1).cgColor
        let colorBorderOne = UIColor(red: 233/255, green: 80/255, blue: 38/255, alpha: 1).cgColor
        let colorBorderTwo = UIColor(red: 229/255, green: 60/255, blue: 57/255, alpha: 1).cgColor
        let colorBorderThree = UIColor(red: 229/255, green: 116/255, blue: 57/255, alpha: 1).cgColor
        
        self.view.setupBackGroundGradient([colorBackgroundOne, colorBackgroundTwo])
        userInfoView.userBlurCell()
        userPictureFrameView.contentMode = .scaleAspectFill
        userPictureFrameView.clipsToBounds = true
        userPictureFrameView.layer.cornerRadius = userPictureFrameView.frame.width / 2
        
        if !status {
            userOnlineStatusView.userBlurCell()
            userPictureBorderView.setupGradientBorder(colors: [colorBackgroundOne, colorBackgroundTwo])
        } else {
            userOnlineStatusView.viewStatusView(colors: [colorBorderOne, colorBorderTwo, colorBorderThree])
            userPictureBorderView.setupGradientBorder(colors: [colorBorderOne, colorBorderTwo, colorBorderThree])
            userOnlineShadowView.viewShadowView()
        }
    }
}

extension DetailInfoViewController {
    
    func makeCall(_ phomeNubmer: String) {
        
        guard let number = URL(string: "tel://" + phomeNubmer) else { return }
        UIApplication.shared.open(number)
    }
    
    func sendMessage(_ phoneNumber: String) {
        
        if MFMessageComposeViewController.canSendText() {
            let message = MFMessageComposeViewController()
            message.messageComposeDelegate = self
            message.recipients = [phoneNumber]
            present(message, animated: true, completion: nil)
        }
    }
    
    func sendMail(_ userEmail: String) {
        
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([userEmail])
            mail.setSubject("Hello and Welcome")
            present(mail, animated: true, completion: nil)
        }
    }
}

extension DetailInfoViewController: MFMessageComposeViewControllerDelegate {
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch result {
        case .cancelled:
            debugPrint("canceled")
        case .failed:
            debugPrint("failed")
        case .sent:
            debugPrint("sent")
        default:
            debugPrint("something wrong")
        }
        controller.dismiss(animated: true, completion: nil)
    }
}

extension DetailInfoViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case .cancelled:
            debugPrint("mail cancelled")
        case .failed:
            debugPrint("mail failed")
        case .sent:
            debugPrint("mail sent")
        case .saved:
            debugPrint("mail saved")
        default:
            debugPrint("something wrong")
        }
        controller.dismiss(animated: true, completion: nil)
    }
}

extension DetailInfoViewController {
    
    func convertDate(_ date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .iso8601)
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let format = DateFormatter()
        format.dateFormat = "MMM d, yyyy"
        if let date = dateFormatter.date(from: date) {
            return format.string(from: date)
        } else {
            return "----"
        }
    }
}

extension DetailInfoViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if mainScrollView.contentOffset.y > 20 {
            UIView.animate(withDuration: 0.5) {
                self.userPictureBorderView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
                self.userNameScaleScrollTopContreaint.constant = self.userNameScaleScrollTopContreaint.constant / 2
                self.view.layoutIfNeeded()
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                self.userPictureBorderView.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.userNameScaleScrollTopContreaint.constant = 20
                self.view.layoutIfNeeded()
            }
        }
    }
}

extension DetailInfoViewController {
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default) { (_) in }
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
}
