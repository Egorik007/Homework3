//
//  NewsTableViewCell.swift
//  дз
//
//  Created by Егор on 29.01.2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet var textField: UILabel!
    
    @IBOutlet var countLike: UILabel!
    @IBOutlet var like: UIButton!
    
    @IBOutlet var time: UILabel!
    
    @IBOutlet var name: UILabel!
    @IBOutlet var avatar: AvatarImage!
    @IBOutlet var photo: UIImageView!
    func configure(text1: String,image:UIImage?,avatar: UIImage?,time: String,name: String)
    {
        textField.text = text1
        photo.image = image
        self.avatar.image = avatar
        self.time.text = time
        self.name.text = name
    }
    

}
