//
//  User.swift
//  7
//
//  Created by Егор on 12.03.2022.
//

import Foundation
import RealmSwift
struct UserFriend:Decodable
{
    
    let response:Response
}

struct Response:Decodable
{
    let count: Int
    let items: [NameFriend]
}

class NameFriend:Object,Decodable
{
    @objc dynamic var firstName: String
    @objc dynamic var lastName: String
    @objc dynamic var photo: String
}

extension NameFriend
{
    enum CodingKeys: String,CodingKey
    {
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_100"
    }
}

extension Response
{
    enum CodingKeys: String,CodingKey
    {   case count = "count"
        case items = "items"
    }
}

extension UserFriend
{
    enum CodingKeys: String,CodingKey
    {
        case response = "response"
    }
}










