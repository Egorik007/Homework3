//
//  Friends.swift
//  дз
//
//  Created by Егор on 27.12.2021.
//

import UIKit

class Friends: UITableViewCell {

    @IBOutlet var userPhoto: UIImageView!
    
    @IBOutlet var friandName: UILabel!
    
    func configure(photo:UIImage,name: String)
    {
        userPhoto.image = photo
        friandName.text = name
    }
    
}
