//
//  GeorgiaData.swift
//  Journey
//
//  Created by Harshitha Tadinada on 7/17/17.
//  Copyright © 2017 UGA. All rights reserved.
//

import Foundation

import Foundation

struct GeorgiaCategory{
    var categoryName: String
    var title: String
    var imageNames: [String]
    var imageLabels: [String]
}

class GeorgiaLibrary{
    
    class func fetchPhotos() -> [GeorgiaCategory]{
        var categories = [GeorgiaCategory]()
        let photosData = GeorgiaLibrary.downloadPhotosData()
        
        for (categoryTitle, dict) in photosData{
            if let dict = dict as? [String: Any]{
                let categoryImageName = dict ["categoryImageName"] as! String
                if let imageNames = dict["imageNames"] as? [String]{
                    if let imageLabels = dict["imageLabels"] as? [String]{
                        let newCategory = GeorgiaCategory(categoryName: categoryImageName, title: categoryTitle, imageNames: imageNames, imageLabels: imageLabels)
                        categories.append(newCategory)
                    }
                }
            }
        }
        return categories
    }
    
    class func downloadPhotosData() -> [String: Any]{
        return[
            "Urban": [
                "categoryImageName": "urban",
                "imageNames": GeorgiaLibrary.generateImage(categoryPrefix: "u", numberOfImages: 6),
                "imageLabels": GeorgiaLibrary.generateLabelNames(startIndex: 0, endIndex: 5),
            ],
            "Mountains": [
                "categoryImageName": "mountains",
                "imageNames": GeorgiaLibrary.generateImage(categoryPrefix: "m", numberOfImages: 6),
                "imageLabels": GeorgiaLibrary.generateLabelNames(startIndex: 6, endIndex: 11),
            ],
            "Beaches": [
                "categoryImageName": "beaches",
                "imageNames": GeorgiaLibrary.generateImage(categoryPrefix: "b", numberOfImages: 6),
                "imageLabels": GeorgiaLibrary.generateLabelNames(startIndex: 18, endIndex: 23),
            ],
            "Historic Land Marks": [
                "categoryImageName": "historic land marks",
                "imageNames": GeorgiaLibrary.generateImage(categoryPrefix: "h", numberOfImages: 6),
                "imageLabels": GeorgiaLibrary.generateLabelNames(startIndex: 12, endIndex: 17),
            ]
        ]
    }
    
    
    private class func generateImage(categoryPrefix: String, numberOfImages: Int) -> [String]{
        var imageNames = [String]()
        
        for i in 1...numberOfImages {
            imageNames.append("\(categoryPrefix)\(i)")
        }
        
        return imageNames
    }
    
    private class func generateLabelNames(startIndex: Int, endIndex: Int) -> [String]{
        var allLabels = [String]()
        var imageLabels = [String]()
        allLabels = ["Atlanta", "Athens", "donkey", "bird", "sofa", "couch", "log", "frog", "pink", "blue", "green", "journey", "later", "rosegold", "gold", "lava", "volcano", "pillow", "one", "two", "three", "four", "five", "six"]
        
        if(endIndex<allLabels.count){
            for i in startIndex...endIndex{
                imageLabels.append(allLabels[i])
            }
        }
        return imageLabels
    }
}
