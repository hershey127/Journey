//
//  NorthAmericaCollectionView.swift
//  Journey
//
//  Created by Harshitha Tadinada on 7/17/17.
//  Copyright © 2017 UGA. All rights reserved.
//

import UIKit

class NorthAmericaCollectionView: UICollectionViewController {
    
    var regionName = [String]()
    var regionImage = [UIImage]()
    
    struct Storyboard{
        static let leftAndRightPaddings: CGFloat = 2.0
        static let numberOfItemsPerRow: CGFloat = 1.0
        static let numberOfTotalItems: CGFloat = 3.0
    }

    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        //Declaring Arrays
        regionImage = [UIImage(named: "NorthAmerica.png")!, UIImage(named: "Canada.png")!, UIImage(named: "Mexico.png")!]
        regionName = ["United States", "Canada", "Mexico"]
        
        //Setting the layout of the collection
        let collectionViewWidth = collectionView?.frame.width
       //let collectionViewHeight = collectionView?.frame.height
        
        let itemWidth = (collectionViewWidth! - Storyboard.leftAndRightPaddings)/Storyboard.numberOfItemsPerRow
       // let itemHeight = (collectionViewHeight!)/Storyboard.numberOfTotalItems
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: itemWidth, height: 119.0)
        
        // Setting the navigation Title
        self.navigationItem.title = "North America"
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return regionName.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as UICollectionViewCell
        
        //ADD A GUARD STATMENT TO AVOID FORCE UNWRAPPING
        let Button = cell.viewWithTag(1) as? UIButton
        let Label = cell.viewWithTag(2) as? UILabel
        
        if(Button != nil && Label != nil){
            Button!.layer.cornerRadius = 9
            Button!.layer.masksToBounds = true
            
            Label!.text = regionName[indexPath.row]
            Button!.setBackgroundImage(self.regionImage[indexPath.row], for: UIControlState.normal)
            Button!.tag = indexPath.row
        }

        
        return cell
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        let selectedImage = sender.tag
        if (selectedImage == 0){
            let vc = storyboard?.instantiateViewController(withIdentifier: "NAStates") as! NAStates
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

