//
//  UserListViewController+Extension.swift
//  usersapp
//
//  Created by alexey sorochan on 19.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

extension UserListViewController {
    
    func setupBackground() {
        let colorOne = UIColor(red: 95/255, green: 96/255, blue: 100/255, alpha: 1).cgColor
        let colorTwo = UIColor(red: 40/255, green: 41/255, blue: 45/255, alpha: 1).cgColor
        self.view.setupBackGroundGradient([colorTwo, colorOne])
    }
}

extension UserListViewController {
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default) { (_) in }
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
}
