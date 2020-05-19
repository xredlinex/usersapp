//
//  DetailInfoViewController+Extension.swift
//  usersapp
//
//  Created by alexey sorochan on 19.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import MessageUI

extension DetailInfoViewController {
    
    func setupBackground() {
        
        let colorBackgroundOne = UIColor(red: 95/255, green: 96/255, blue: 100/255, alpha: 1).cgColor
        let colorBackgroundTwo = UIColor(red: 40/255, green: 41/255, blue: 45/255, alpha: 1).cgColor
        
        self.view.setupBackGroundGradient([colorBackgroundOne, colorBackgroundTwo])
        
        userPictureFrameView.contentMode = .scaleAspectFill
        userPictureFrameView.clipsToBounds = true
        userPictureFrameView.layer.cornerRadius = userPictureFrameView.frame.width / 2
        
        let colorBorderOne = UIColor(red: 233/255, green: 80/255, blue: 38/255, alpha: 1).cgColor
        let colorBorderTwo = UIColor(red: 229/255, green: 60/255, blue: 57/255, alpha: 1).cgColor
        let colorBorderThree = UIColor(red: 229/255, green: 116/255, blue: 57/255, alpha: 1).cgColor
        
        userPictureBorderView.setupGradientBorder(colors: [colorBorderOne, colorBorderTwo, colorBorderThree])
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
