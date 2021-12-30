//
//  Friends.swift
//  дз
//
//  Created by Егор on 27.12.2021.
//

import UIKit

class Friends: UITableViewCell {

    @IBOutlet var userPhoto: AvatarImage!
    
    @IBOutlet var friandName: UILabel!
    
    @IBOutlet var like: UIButton!
    
 
        private func Like()
    {
        //
        like.setImage(UIImage(systemName: "heart"), for: .normal)
        like.setImage(UIImage(systemName: "heart.fill"), for: .highlighted)
    }
    
    
    func configure(photo:UIImage,name: String)
    {
        userPhoto.image = photo
        friandName.text = name
    }
    
}
