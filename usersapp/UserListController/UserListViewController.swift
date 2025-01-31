//
//  UserListViewController.swift
//  usersapp
//
//  Created by alexey sorochan on 16.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class UserListViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var users: [UserModel] = []
    var maxCount = 200
    var pageSize = 10
    var pageNumber = 1
    var isloaded = true
    var isListView = true
    var estimateWidth = 100
    var cellMarginSize = 5
    var errorTextMsg = AlertErrors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        self.setupGridView()
        
        if users.isEmpty {
            isloaded = false
            requestUsers()
        }
        
        collectionView.register(UINib(nibName: "UsersListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "UsersListCollectionViewCell")
        collectionView.register(UINib(nibName: "UserGridCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "UserGridCollectionViewCell")
        collectionView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let gradientLayers = self.view.layer.sublayers?.compactMap { $0 as? CAGradientLayer }
        gradientLayers?.first?.frame = self.view.bounds
        
        self.setupGridView()
    }
    
    @IBAction func didTapChangeSegmentedControl(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            isListView = true
            UIView.transition(with: collectionView,
                              duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: { self.collectionView.reloadData() })
        case 1:
            isListView = false
            UIView.transition(with: collectionView,
                              duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: { self.collectionView.reloadData() })
        default:
            break
        }
    }
    
    @IBAction func didTapReloadUsersActioButton(_ sender: Any) {
        
        let alertController = UIAlertController(title: "", message: errorTextMsg.errorKey(error: .reloadUsers), preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default) { (_) in
            self.users.removeAll()
            self.pageNumber = 1
            self.isloaded = false
            self.requestUsers()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        alertController.addAction(alertAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}



