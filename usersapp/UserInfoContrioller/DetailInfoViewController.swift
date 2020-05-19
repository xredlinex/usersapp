//
//  DetailInfoViewController.swift
//  usersapp
//
//  Created by alexey sorochan on 19.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class DetailInfoViewController: UIViewController {
    
    
    var user: UserModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBackground()
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
