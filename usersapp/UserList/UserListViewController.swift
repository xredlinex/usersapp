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
    var pageSize = 10
    var pageNumber = 1
    var isloaded = true
    var isListView = true

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        requestUsers()
//        if users.isEmpty {
//            isloaded = true
//            requestUsers()
//        }
//        
        
        collectionView.register(UINib(nibName: "UsersListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "UsersListCollectionViewCell")
        collectionView.register(UINib(nibName: "UserGridCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "UserGridCollectionViewCell")
        collectionView.reloadData()
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
}

extension UserListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if isListView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UsersListCollectionViewCell", for: indexPath) as! UsersListCollectionViewCell
            cell.updateListCell(users[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserGridCollectionViewCell", for: indexPath) as! UserGridCollectionViewCell
            cell.updateGrdiCell(users[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if isListView {
            
            
            let size = CGSize(width: collectionView.frame.width , height: 118)
            return size
        } else {
             let size = CGSize(width: collectionView.frame.width / 3 - 10 , height: 100)
             return size
        }
     }
}
