//
//  TweetAdapter.swift
//  Collor
//
//  Created by Guihal Gwenn on 05/09/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import Collor
import UIKit

struct TweetAdapter: CollectionAdapter {

    let label:NSAttributedString
    let imageURL:URL
    let backgroundColor:UIColor
    
    init(tweet:Tweet) {
        label = NSAttributedString(string: tweet.text, attributes: [
            NSFontAttributeName: UIFont.systemFont(ofSize: 18),
            NSForegroundColorAttributeName: UIColor.black
            ])
        imageURL = URL(string: tweet.userProfileImageURL)!
        backgroundColor = UIColor(rgb: tweet.color)
    }
}