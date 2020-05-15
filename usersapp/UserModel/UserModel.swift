//
//  UserModel.swift
//  usersapp
//
//  Created by alexey sorochan on 15.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation

class UserModel {
    var id: UserId?
    var gender: String?
    var name: UserName?
    var email: String?
    var picture: UserPicture?
}

class UserId {
    var name: String?
    var valuse: String?
}

class UserName {
    var title: String?
    var first: String?
    var last: String?
}

class UserPicture {
    var large: String?
    var medium: String?
    var thumbnail: String?
}
