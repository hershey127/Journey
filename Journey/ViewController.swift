    //
//  ViewController.swift
//  Journey
//
//  Created by Harshitha Tadinada on 6/15/17.
//  Copyright © 2017 UGA. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
    
class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var atlantaView: UIView!
    @IBOutlet weak var atlantaPics_ImageView: UIImageView!
    @IBOutlet weak var map: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Locations Marks on Maps
        let location = CLLocationCoordinate2DMake(33.74718045, -84.38049316)
        let span = MKCoordinateSpanMake(0.2, 0.2)
        let region = MKCoordinateRegionMake(location, span)
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Atlanta"
        
        map.addAnnotation(annotation)
        
        // Creating an array for animation of slide show
        atlantaPics_ImageView.animationImages = [
        UIImage(named: "church.png")!,
        UIImage(named: "ice.png")!,
        UIImage(named: "jurassic.png")!,
        UIImage(named: "lake.png")!
        ]
        
        atlantaPics_ImageView.animationDuration = 10
        atlantaPics_ImageView.startAnimating()
        
        self.navigationItem.title = "Atlanta"

    }
}

