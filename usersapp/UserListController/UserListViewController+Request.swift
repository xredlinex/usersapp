//
//  UserListViewController+Request.swift
//  usersapp
//
//  Created by alexey sorochan on 16.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import Alamofire

extension UserListViewController {
    
    func requestUsers() {
        
        if !isloaded {
            let parameters = ["page": pageNumber,
                              "results": pageSize]
            let url = URL(string: "https://randomuser.me/api/")
            if let urlCorrect = url {
                AF.request(urlCorrect, parameters: parameters, encoding: URLEncoding.default).responseData { (response) in
                    if let data = response.data {
                        do {
                            let resultModel = try JSONDecoder().decode(ResultsModel.self, from: data)
                            if let users = resultModel.results {
                                self.users.append(contentsOf: users)
                                DispatchQueue.main.async {
                                    self.collectionView.reloadData()
                                }
                            } else {
                                self.showAlert(message: self.errorTextMsg.errorKey(error: .cantLoadUsers))
                            }
                        } catch {
                            print(error)
                        }
                    } else {
                        self.showAlert(message: self.errorTextMsg.errorKey(error: .request))
                    }
                }
            } else {
                showAlert(message: errorTextMsg.errorKey(error: .urlError))
            }
        }
    }
}
