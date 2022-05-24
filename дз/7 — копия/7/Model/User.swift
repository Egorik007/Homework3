//
//  User.swift
//  7
//
//  Created by Егор on 12.03.2022.
//

import Foundation

struct UserFriend
{
    
    let response:Response
}

struct Response
{
    let count: Int
    let items: [NameFriend]
}

struct NameFriend
{
    let firstName: String
    let lastName: String
    let photo: String
}

extension NameFriend: Codable
{
    enum CodingKeys: String,CodingKey
    {
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_100"
    }
}

extension Response: Codable
{
    enum CodingKeys: String,CodingKey
    {   case count = "count"
        case items = "items"
    }
}

extension UserFriend: Codable
{
    enum CodingKeys: String,CodingKey
    {
        case response = "response"
    }
}








