//
//  UserGridCollectionViewCell.swift
//  usersapp
//
//  Created by alexey sorochan on 16.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import Kingfisher

class UserGridCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var userPictureBorderView: UIView!
    @IBOutlet weak var userPictureView: UIView!
    @IBOutlet weak var userPictureImageView: UIImageView!
    @IBOutlet weak var onlineStatusView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForReuse() {
           super.prepareForReuse()
//        userPictureBorderView.layer.borderWidth = 0
        userPictureImageView.image = nil
//        userPictureBorderView.layer.borderWidth = 0
//        userPictureBorderView.layer.borderColor = UIColor.clear.cgColor
    }
    
    
    func updateGrdiCell(_ user: UserModel) {
        
        setupCellUi(user.status)
        
        if let url = URL(string: user.picture?.medium ?? "") {
            userPictureImageView.kf.setImage(with: url)
        }

        
    }
    
}

extension UserGridCollectionViewCell {
    
    func setupCellUi(_ onlineStatus: Bool) {
        
        if !onlineStatus {
            
//            userPictureBorderView.setupForOfflineUser()
            
            userPictureBorderView.layer.borderColor = UIColor.lightGray.cgColor
            onlineStatusView.layer.backgroundColor = UIColor.clear.cgColor
        } else {
//            userPictureBorderView.setupForRoundLayer()
            userPictureBorderView.layer.borderColor = UIColor.green.cgColor
            onlineStatusView.layer.backgroundColor = UIColor.green.cgColor
            
        }
        
        userPictureBorderView.clipsToBounds = true
        userPictureBorderView.layer.cornerRadius = userPictureBorderView.frame.width / 2
        userPictureBorderView.layer.borderWidth = 2
        userPictureView.clipsToBounds = true
        userPictureView.layer.cornerRadius = userPictureView.frame.width / 2
//        userPictureView.layer.borderWidth = 0.25
//        userPictureView.layer.borderColor = UIColor.black.cgColor
        onlineStatusView.clipsToBounds = true
        onlineStatusView.layer.cornerRadius = onlineStatusView.frame.width / 2
    }
}

extension UIView {

    func setupForRoundLayer() {

        let firstColor = UIColor(red: 197/255, green: 23/255, blue: 0/255, alpha: 1).cgColor
        let secondColor = UIColor(red: 255/255, green: 251/255, blue: 0/255, alpha: 1).cgColor
        let lineWidth: CGFloat = 2
        let rect = self.bounds.insetBy(dx: lineWidth / 2, dy: lineWidth / 2)
        let path = UIBezierPath(roundedRect: rect, cornerRadius: self.frame.size.width / 2)
        let gradient = CAGradientLayer()

        gradient.frame =  CGRect(origin: CGPoint.zero, size: self.frame.size)
        gradient.colors = [firstColor, secondColor]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)

        let shape = CAShapeLayer()
        shape.lineWidth = lineWidth
        shape.path = path.cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape
        self.layer.addSublayer(gradient)
    }


    func setupForOfflineUser() {
        
        let view = self
        
        view.clipsToBounds = true
        view.layer.cornerRadius = view.frame.width / 2
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
    }

}

