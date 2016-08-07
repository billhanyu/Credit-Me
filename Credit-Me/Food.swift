//
//  Food.swift
//  Credit-Me
//
//  Created by Bill Yu on 8/7/16.
//  Copyright © 2016 Bill Yu. All rights reserved.
//

import Foundation

// /foods/
class Food {
    var price = 0.0
    var name = ""
    
    func equals(other: Food) -> Bool {
        return price == other.price && name == other.name
    }
}
