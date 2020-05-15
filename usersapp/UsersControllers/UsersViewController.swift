//
//  UsersViewController.swift
//  usersapp
//
//  Created by alexey sorochan on 15.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var viewContainer: UIView!
    
     var usersListViews = [UIView]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewControllers()
    }
    
    @IBAction func didTapsegmentedControl(_ sender: Any) {
        self.viewContainer.bringSubviewToFront(usersListViews[segmentedControl.selectedSegmentIndex])
    }
    
  

}

extension UsersViewController {
    
    func setupViewControllers() {
        
        
        usersListViews.append(ListViewController().view)
        usersListViews.append(GridViewController().view)
        
        for controller in usersListViews {
            viewContainer.addSubview(controller)
        }
        viewContainer.bringSubviewToFront(usersListViews[0])
    }
}
