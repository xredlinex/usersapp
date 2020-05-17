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
    
    var estimateWidth = 100.0
    var cellMarginSize = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestUsers()
        //        if users.isEmpty {
        //            isloaded = true
        //            requestUsers()
        //        }
        //
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
    
    func setupGridView() {
        let flow = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
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

extension UserListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
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
}


extension UserListViewController: UICollectionViewDelegateFlowLayout {
    
    func calculateWith() -> CGFloat {
        let estimatedWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))
        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
        return width
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if isListView {
            let size = CGSize(width: collectionView.frame.width , height: 118)
            return size
        } else {
            let width = self.calculateWith()
            return CGSize(width: width, height: width)
        }
    }
}
