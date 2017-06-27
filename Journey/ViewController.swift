    //
//  ViewController.swift
//  Journey
//
//  Created by Harshitha Tadinada on 6/15/17.
//  Copyright © 2017 UGA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var atlantaView: UIView!
    @IBOutlet weak var atlantaPics_ImageView: UIImageView!
    @IBOutlet weak var Itenerary: UILabel!
    @IBOutlet weak var Atlanta_2Day: UILabel!
    @IBOutlet weak var map: UIImageView!
    @IBOutlet weak var listedItenerary: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Creating an array for animation of slide show
        atlantaPics_ImageView.animationImages = [
        UIImage(named: "church.png")!,
        UIImage(named: "ice.png")!,
        UIImage(named: "jurassic.png")!,
        UIImage(named: "lake.png")!
        ]
        
        atlantaPics_ImageView.animationDuration = 10
        atlantaPics_ImageView.startAnimating()
        
        

    }
}

