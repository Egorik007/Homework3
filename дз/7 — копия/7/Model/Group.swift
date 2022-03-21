//
//  Group.swift
//  7
//
//  Created by Егор on 12.03.2022.
//

import Foundation


struct UserGroup
{
    
    let response:ResponseGroup
}

struct ResponseGroup
{

    let items: [NameGroup]
}

struct NameGroup
{
    let name: String
    let photo:String
}

extension NameGroup: Codable
{
    enum CodingKeys: String,CodingKey
    {
  case name = "name"
        case photo = "photo_100"
    }
}

extension ResponseGroup: Codable
{
    enum CodingKeys: String,CodingKey
    {
        case items = "items"
    }
}

extension UserGroup: Codable
{
    enum CodingKeys: String,CodingKey
    {
        case response = "response"
    }
}
