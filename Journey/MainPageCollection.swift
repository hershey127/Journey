//
//  MainPageCollection.swift
//  Journey
//
//  Created by Harshitha Tadinada on 7/18/17.
//  Copyright © 2017 UGA. All rights reserved.
//

import UIKit

class MainPageCollection: UICollectionViewController {
    
    var name = [String]()
    var image = [UIImage]()
    
    struct Storyboard{
        static let leftAndRightPaddings: CGFloat = 2.0
        static let numberOfItemsPerRow: CGFloat = 2.0
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        //Declaring the arrays
        name = ["Journey", "Featured Journeys", "My Journeys","My Account"]
        
        //Setting the layout of the collection
        let collectionViewWidth = collectionView?.frame.width
        
        let itemWidth = (collectionViewWidth! - Storyboard.leftAndRightPaddings)/Storyboard.numberOfItemsPerRow
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        
        // Setting navigation Title
        self.navigationItem.title = "Main Page"
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return name.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as UICollectionViewCell
        
        let Button = cell.viewWithTag(1) as? UIButton
        let Label = cell.viewWithTag(2) as? UILabel
        
        if(Button != nil && Label != nil){
            Button!.layer.cornerRadius = 9
            Button!.layer.masksToBounds = true
            
            Label!.text = name[indexPath.row]
           // Button!.setBackgroundImage(self.image[indexPath.row], for: UIControlState.normal)
            Button!.tag = indexPath.row
        }
        
        return cell
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        let selectedImage = sender.tag
        if (selectedImage == 0){
            let vc = storyboard?.instantiateViewController(withIdentifier: "Continents") as! ContinentCollectionView
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    
    
}

