//
//  UserModel.swift
//  usersapp
//
//  Created by alexey sorochan on 15.05.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class InfoModel: Codable {
    var seed: String?
    var results: Int?
    var page: Int?
    var version: String?
    
    enum CodingKesy: String, CodingKey {
        case seed, results, page, version
    }
}

class ResultsModel: Codable {
    var results: [UserModel]?
    var info: InfoModel?
    
    enum CodingKeys: String, CodingKey {
        case results, info
    }
}

class UserModel: Codable {
    var status = Bool.random()
    var id: UserId?
    var gender: String?
    var name: UserName?
    var email: String?
    var picture: UserPicture?
    var phone: String?
    var cell: String
    var location: UserLocation?
    
    enum CodingKeys: String, CodingKey {
        case id, gender, name, email, picture, phone, cell, location
    }
}

class UserLocation: Codable {
    var city: String?
    var state: String?
    
    enum CodingKeys: String, CodingKey {
        case city, state
    }
}

class UserId: Codable {
    var name: String?
    var valuse: String?
    
    enum CodingKeys: String, CodingKey {
        case name, valuse
    }
}

class UserName: Codable {
    var title: String?
    var first: String?
    var last: String?
    
    enum CodingKeys: String, CodingKey {
        case title, first, last
    }
}

class UserPicture: Codable {
    var large: String?
    var medium: String?
    var thumbnail: String?
    
    enum CodingKeys: String, CodingKey {
        case large, medium, thumbnail
    }
}
