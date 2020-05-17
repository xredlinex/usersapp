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
    
    var maxCount = 2000
    var pageSize = 20
    var pageNumber = 1
    var isloaded = true
    var isListView = true
    
    var estimateWidth = 100.0
    var cellMarginSize = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if users.isEmpty {
            isloaded = false
            requestUsers()
        }
        
        self.setupGridView()
        collectionView.register(UINib(nibName: "UsersListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "UsersListCollectionViewCell")
        collectionView.register(UINib(nibName: "UserGridCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "UserGridCollectionViewCell")
        collectionView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.setupGridView()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    
    @IBAction func didTapChangeSegmentedControl(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            isListView = true
            collectionView.reloadData()
        case 1:
            isListView = false
            collectionView.reloadData()
        default:
            break
        }
    }
    
    
    @IBAction func didTapReloadUsersActioButton(_ sender: Any) {
        
        users.removeAll()
        pageNumber = 1
        isloaded = false
        requestUsers()
    }
}

