//
//  GridViewController.swift
//  usersapp
//
//  Created by alexey sorochan on 15.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class GridViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "UsersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "UsersCollectionViewCell")
    }
}


extension GridViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UsersCollectionViewCell", for: indexPath) as! UsersCollectionViewCell
        return cell
    }
    
    
    
    
    
}
