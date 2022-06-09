//
//  Group.swift
//  7
//
//  Created by Егор on 12.03.2022.
//

import Foundation
import RealmSwift

struct UserGroup:Decodable
{
    
    let response:ResponseGroup
}

struct ResponseGroup:Decodable
{

    let items: [NameGroup]
}

class  NameGroup: Object,Decodable
{
    @objc dynamic var name: String = ""
    @objc dynamic var photo:String = ""
}

extension NameGroup
{
    enum CodingKeys: String,CodingKey
    {
  case name = "name"
        case photo = "photo_100"
    }
}

extension ResponseGroup
{
    enum CodingKeys: String,CodingKey
    {
        case items = "items"
    }
}

extension UserGroup
{
    enum CodingKeys: String,CodingKey
    {
        case response = "response"
    }
}




