//
//  GeorgiaViewController.swift
//  Journey
//
//  Created by Harshitha Tadinada on 7/17/17.
//  Copyright © 2017 UGA. All rights reserved.
//

import UIKit

class GeorgiaViewController: UICollectionViewController {
    
    var photoCategories: [GeorgiaCategory] = GeorgiaLibrary.fetchPhotos()
    
    struct Storyboard{
        static let leftAndRightPaddings: CGFloat = 2.0
        static let numberOfItemsPerRow: CGFloat = 3.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let collectionViewWidth = collectionView?.frame.width
        let itemWidth = (collectionViewWidth! - Storyboard.leftAndRightPaddings)/Storyboard.numberOfItemsPerRow
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        
        self.navigationItem.title = "Georgia"
    }
    
    //MARK: -UICOllectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return photoCategories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoCategories[section].imageNames.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GeorgiaPhotoCell", for: indexPath) as! GeorgiaPhotoCell
        
        let photoCategory = photoCategories[indexPath.section]
        let imageNames = photoCategory.imageNames
        let imageLabels = photoCategory.imageLabels
        let imageName = imageNames[indexPath.item]
        let imageLabel = imageLabels[indexPath.item]
        
        
        cell.imageName = imageName
        cell.imageLabel.text = imageLabel
        
        let Button = cell.viewWithTag(1) as? UIButton
        
        if(Button != nil){
            Button!.tag = indexPath.row
        }
        

        
        
        
        return cell
    }
    
    //Section Header View
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "GeorgiaSectionHeaderView", for: indexPath) as! GeorgiaSectionHeaderView
        let category = photoCategories[indexPath.section]
        
        sectionHeaderView.categoryTitle = category.title
        
        
        return sectionHeaderView
    }
    @IBAction func buttonClicked(_ sender: UIButton) {
        let selectedImage = sender.tag
        if (selectedImage == 0){
            let vc = storyboard?.instantiateViewController(withIdentifier: "IteneraryPage") as! ViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}


