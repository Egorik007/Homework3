//
//  GroupModel.swift
//  7
//
//  Created by Егор on 17.02.2022.
//

import UIKit


struct GroupModel
{
    let nameGroup: String
    let photoGroup: UIImage
}

extension GroupModel: Equatable
{
    static func == (lhs: Self,rhs: Self) -> Bool
    {
        lhs.nameGroup == rhs.nameGroup
    }
}
