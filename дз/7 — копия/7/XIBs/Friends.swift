//
//  FriendsTableViewCell.swift
//  7
//
//  Created by Егор on 17.02.2022.
//

import UIKit
import Kingfisher
class Friends: UITableViewCell {

    @IBOutlet var userPhoto: AvatarImage!
    
    @IBOutlet var friandName: UILabel!
    
 

    @IBAction func didTapAnim(_ sender: Any) {
        
        animate0()
        animate1()
    }
    
 
    
    
    func configure(photo:URL,name: String)
    {
        userPhoto.kf.setImage(with: photo)
        friandName.text = name
 
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()

        userPhoto.clipsToBounds = true
        userPhoto.layer.cornerRadius = userPhoto.frame.width / 2
    }
    
    
    @IBOutlet var constraint: [NSLayoutConstraint]!
    
    
    let duration = 2.0
    let delay = 0.5
    
    func animate0 ()
    {
        super.layoutIfNeeded()
        UIView.animate(
            withDuration: duration,
            delay: delay,
            options: [.curveEaseInOut,
                      
                      .autoreverse]) {
                self.constraint[0].isActive = false
                super.layoutIfNeeded()
            } completion: { isCompleted in
                
                self.constraint[0].isActive = true
                self.userPhoto.alpha = 1.0
                super.layoutIfNeeded()
            }

            
    }
    
    
    func animate1()
        {
            UIView.animate(withDuration: duration,
                           delay: delay,
                           usingSpringWithDamping: 0.2,
                           initialSpringVelocity: 0,
                           options: []) {
                self.userPhoto.frame.origin.x += 35
            }
        }
    
}
