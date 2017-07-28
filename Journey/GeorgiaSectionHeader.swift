//
//  GeorgiaSectionHeader.swift
//  Journey
//
//  Created by Harshitha Tadinada on 7/17/17.
//  Copyright © 2017 UGA. All rights reserved.
//

import UIKit

class GeorgiaSectionHeaderView: UICollectionReusableView{
    @IBOutlet weak var categoryLabel: UILabel!
    
    var categoryTitle: String!{
        didSet{
            categoryLabel.text = categoryTitle
        }
    }
}

