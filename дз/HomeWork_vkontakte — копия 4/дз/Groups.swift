//
//  Groups.swift
//  дз
//
//  Created by Егор on 27.12.2021.
//

import UIKit
@IBDesignable
class Groups: UITableViewCell {

    
    @IBOutlet var groupPhoto: UIImageView!
    
    @IBOutlet var groupName: UILabel!
  
    func configure(photo:UIImage,name: String)
    {
        groupPhoto.image = photo
        groupName.text = name
    }
}
