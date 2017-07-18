//
//  GeorgiaPhotoCell.swift
//  Journey
//
//  Created by Harshitha Tadinada on 7/17/17.
//  Copyright © 2017 UGA. All rights reserved.
//

import Foundation

import UIKit

class GeorgiaPhotoCell: UICollectionViewCell{
    
    @IBOutlet weak var categoryImage: UIButton!
    @IBOutlet weak var imageLabel: UILabel!
    
    
    var imageName: String!{
        didSet{
            categoryImage.setBackgroundImage(UIImage(named: imageName), for: UIControlState.normal)
            categoryImage.layer.cornerRadius = 9
            categoryImage.layer.masksToBounds = true
        }
    }
    
    
}
