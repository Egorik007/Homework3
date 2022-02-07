//
//  PhotoCollectionCell.swift
//  дз
//
//  Created by Егор on 27.01.2022.
//

import UIKit

class PhotoCollectionCell: UICollectionViewCell {

    @IBOutlet var emblem: UIImageView!
    
    @IBOutlet var counter: UILabel!
    @IBOutlet var button: UIButton!
    var a = false
    var counter1 = 0
    @IBAction func like(_ sender: Any) {
        animate()

    }
    
    func configure(emblem: UIImage?)
    {
        self.emblem.image = emblem
    }
    
    
    
    func animate()
    {
        
                if (a == false)
                {
                    a = true
                    button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                    counter1 += 1
   
                    
                  
                }
                else {a = false
                    button.setImage(UIImage(systemName: "heart"), for: .normal)
                    counter1 -= 1
                    
        
                }
        
        
        UIView.transition(
            with: counter,
            duration: 0.25,
            options: .transitionCrossDissolve) {[self] in
                counter.text = String(counter1)
            }
        
    }
    
}
