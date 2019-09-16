//
//  ModelRewards.swift
//  Awards
//
//  Created by Terretino on 15/09/19.
//  Copyright © 2019 Terretino. All rights reserved.
//

import Foundation
import UIKit

class Reward {
    var image: UIImage?
    var type: String
    var poin: Int
    var price: String
    
    init(image: UIImage?, type: String, poin: Int, price: String){
        self.image = image
        self.type = type
        self.poin = poin
        self.price = price
    }
    
    
}
