//
//  ContinentCollectionView.swift
//  Journey
//
//  Created by Harshitha Tadinada on 7/17/17.
//  Copyright © 2017 UGA. All rights reserved.
//

import UIKit

class ContinentCollectionView: UICollectionViewController {
    
    var stateName = [String]()
    var stateImage = [UIImage]()
    
    struct Storyboard{
        static let leftAndRightPaddings: CGFloat = 2.0
        static let numberOfItemsPerRow: CGFloat = 1.0
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        //Declaring the arrays
        stateImage = [UIImage(named: "NorthAmerica.png")!, UIImage(named: "Europe.png")!, UIImage(named: "SouthAmerica.png")!, UIImage(named: "Asia.png")!,UIImage(named: "Australia.png")!, UIImage(named: "Africa.png")!]
        stateName = ["North America", "Europe", "South America","Asia","Australia","Africa"]
        
        //Setting the layout of the collection
        let collectionViewWidth = collectionView?.frame.width
        
        let itemWidth = (collectionViewWidth! - Storyboard.leftAndRightPaddings)/Storyboard.numberOfItemsPerRow
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: itemWidth, height: 120.0)
        
        // Setting navigation Title
        self.navigationItem.title = "Continents"
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stateName.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "continent", for: indexPath) as UICollectionViewCell
        
        let Button = cell.viewWithTag(1) as? UIButton
        let Label = cell.viewWithTag(2) as? UILabel
        
        if(Button != nil && Label != nil){
            Button!.layer.cornerRadius = 9
            Button!.layer.masksToBounds = true
        
            Label!.text = stateName[indexPath.row]
            Button!.setBackgroundImage(self.stateImage[indexPath.row], for: UIControlState.normal)
            Button!.tag = indexPath.row
        }
        
        return cell
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        let selectedImage = sender.tag
        if (selectedImage == 0){
            let vc = storyboard?.instantiateViewController(withIdentifier: "NorthAmerica") as! NorthAmericaCollectionView
            self.navigationController?.pushViewController(vc, animated: true)
        }

    }

    
    
}
