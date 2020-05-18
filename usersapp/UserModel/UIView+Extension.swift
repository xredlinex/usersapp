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
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = self.layer.frame
        self.layer.insertSublayer(gradient, at: 0)
    }
}

