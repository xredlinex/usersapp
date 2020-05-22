//
//  ErrorAlertModel.swift
//  usersapp
//
//  Created by alexey sorochan on 22.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation

class AlertErrors {
    
    enum ErrorText {
        case cantLoadUsers
        case noUserInfo
        case userOffline
        case reloadUsers
        case urlError
        case request
        case noEmail
        case noCell
    }
    
    func errorKey(error: ErrorText) -> String {
        
        switch error {
        case .cantLoadUsers:
            return "Sorry Cant't Load Users"
        case . noUserInfo:
            return "No User Info, Sorry"
        case .userOffline:
            return "User is Offline"
        case .reloadUsers:
            return "Reload Users?"
        case .urlError:
            return "Server Or Request Error"
        case .request:
            return "Error, Bad Request"
        case .noEmail:
            return "No User Email Address"
        case .noCell:
            return "No User Cell Phone Number"
        }
    }
}
