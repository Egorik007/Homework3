//
//  Groups.swift
//  7
//
//  Created by Егор on 17.02.2022.
//

import UIKit
import Kingfisher
@IBDesignable
class Groups: UITableViewCell {

    @IBOutlet var constraint: [NSLayoutConstraint]!
    
    @IBOutlet var groupPhoto: AvatarImage!
    
    @IBOutlet var groupName: UILabel!
    
    
  
    func configure(photo: URL,name: String)
    {
        groupPhoto.kf.setImage(with: photo)
        groupName.text = name
        
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()

        groupPhoto.clipsToBounds = true
        groupPhoto.layer.cornerRadius = groupPhoto.frame.width / 2
    }

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
                self.groupPhoto.alpha = 1.0
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
            self.groupPhoto.frame.origin.x += 49
        }
    }
    
    @IBAction func didTapAnimate(_ sender: Any) {
        
    animate0()
        animate1()
        
        
    }
    
//    func animate1 ()
//    {
//        super.layoutIfNeeded()
//        UIView.animate(
//            withDuration: duration,
//            delay: delay,
//            options: [.curveEaseInOut,
//                      .repeat,
//                      .autoreverse]) {
//                          self.groupPhoto.frame.origin.x += 100
//                super.layoutIfNeeded()
//            } completion: { isCompleted in
//                self.groupPhoto.frame.origin.x -= 100
//                super.layoutIfNeeded()
//            }
//
//
//    }
    
}
