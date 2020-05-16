//
//  ListViewController.swift
//  usersapp
//
//  Created by alexey sorochan on 15.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import Alamofire

class ListViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var page = 1
    var results = 100
    var isLoaded = false
    
    var users: [UserModel] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint("this page")
        requestUsers()
        
        tableView.register(UINib(nibName: "UsersTableViewCell", bundle: nil), forCellReuseIdentifier: "UsersTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
        
        
        
    }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsersTableViewCell", for: indexPath) as! UsersTableViewCell
        debugPrint(indexPath)
        cell.updateUserCell(users[indexPath.row])
        return cell
    }
}


extension ListViewController {
    
    
      func requestUsers() {
          
          let parameters = ["page": page,
                            "results": results]
        let url = URL(string: "https://randomuser.me/api/")
        if let urlCorrect = url {
            
           
            
            AF.request(urlCorrect, parameters: parameters, encoding: URLEncoding.default).responseData { (response) in
                
                if let data = response.data {
                    
                    do {
                        let resultsModel = try JSONDecoder().decode(ResultsModel.self, from: data)
                        if let user = resultsModel.results  {
                            for i in user {
                                debugPrint(i.name?.first, i.name?.last)
                            }
                            self.users.append(contentsOf: user)
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                debugPrint("<-------------reload data")
                            }
                        }
                       
                        
                        
                    } catch  {
                        print(error)
                    }
                    
                }
            }
            
            
            
            
        }
        
        
        
      }
    
    
    
}
