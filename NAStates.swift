//
//  NAStates.swift
//  Journey
//
//  Created by Harshitha Tadinada on 7/12/17.
//  Copyright © 2017 UGA. All rights reserved.
//

import UIKit

class NAStates: UICollectionViewController {
    
    var stateName = [String]()
    var stateImage = [UIImage]()
    
    struct Storyboard{
        static let leftAndRightPaddings: CGFloat = 2.0
        static let numberOfItemsPerRow: CGFloat = 2.0
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        // Declaring Arrays
        stateImage = [UIImage(named: "church.png")!, UIImage(named: "ice.png")!, UIImage(named: "jurassic.png")!, UIImage(named: "lake.png")!,UIImage(named: "church.png")!, UIImage(named: "ice.png")!, UIImage(named: "jurassic.png")!, UIImage(named: "lake.png")!, UIImage(named: "church.png")!, UIImage(named: "ice.png")!, UIImage(named: "jurassic.png")!, UIImage(named: "lake.png")!]
        stateName = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Conneticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho"]
        
        //Setting the layout of the collection
        let collectionViewWidth = collectionView?.frame.width
        
        let itemWidth = (collectionViewWidth! - Storyboard.leftAndRightPaddings)/Storyboard.numberOfItemsPerRow
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: itemWidth, height: 124.0)
        
        // Setting navigation title
        self.navigationItem.title = "States"
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stateName.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as UICollectionViewCell
        
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
        if (selectedImage == 9){
            let vc = storyboard?.instantiateViewController(withIdentifier: "GeorgiaViewController") as! GeorgiaViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    

}
