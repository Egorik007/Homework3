//
//  ForecastCollectionCell.swift
//  дз
//
//  Created by Егор on 27.12.2021.
//

import UIKit

final class ForecastCollectionCell: UICollectionViewCell {


  
    @IBOutlet var emblem: UIImageView!
    
    
    func configure(
                   emblem: UIImage?
)
    {
     
        self.emblem.image = emblem
    
    }
}
