//
//  UIView+Extension.swift
//  usersapp
//
//  Created by alexey sorochan on 17.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

extension UIView {
    
    func setupBackGroundGradient(_ colors: [CGColor]) {
        
        let gradient = CAGradientLayer()
        gradient.colors = colors
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0.3, y: 0.9)
        gradient.endPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.frame = self.layer.frame
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func userBlurCell() {
        
        let blurEffect = UIBlurEffect(style: .systemThinMaterialDark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.layer.cornerRadius = 6
        blurView.clipsToBounds = true
        self.insertSubview(blurView, at: 0)
        self.clipsToBounds = true
        self.layer.cornerRadius = 6
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 7, height: 7)
        self.layer.shadowRadius = 6
        self.isOpaque = true
        NSLayoutConstraint.activate([blurView.heightAnchor.constraint(equalTo: self.heightAnchor),
                                     blurView.widthAnchor.constraint(equalTo: self.widthAnchor)])
    }
}

extension UIView {
    
    func setupGradientBorder(colors: [CGColor]) {
        
        let view = self
        let lineWidth: CGFloat = 8
        let rect = view.bounds.insetBy(dx: lineWidth / 2, dy: lineWidth / 2)
        let path = UIBezierPath(roundedRect: rect, cornerRadius: view.frame.width / 2)
        let gradiet = CAGradientLayer()
        gradiet.frame = CGRect(origin: CGPoint.zero, size: view.frame.size)
        gradiet.colors = colors
        gradiet.startPoint = CGPoint(x: 0, y: 0.5)
        gradiet.endPoint = CGPoint(x: 1, y: 0.5)
        let shape = CAShapeLayer()
        shape.lineWidth = lineWidth
        shape.path = path.cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradiet.mask = shape
        view.layer.addSublayer(gradiet)
    }
}

extension UIView {
    
    func cornerRadiusView(corners: UIRectCorner, radius: CGFloat) {
        
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func viewStatusView(colors: [CGColor]) {
        
        let gradient: CAGradientLayer = CAGradientLayer()
        self.clipsToBounds = true
        self.layer.cornerRadius = 12
        gradient.colors = colors
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 0.5, y: 0.3)
        gradient.frame = self.layer.bounds
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func viewShadowView() {
        
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 7, height: 7)
        self.layer.shadowRadius = 6
        self.isOpaque = true
    }
}
