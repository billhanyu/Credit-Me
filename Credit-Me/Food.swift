//
//  Food.swift
//  Credit-Me
//
//  Created by Bill Yu on 8/7/16.
//  Copyright © 2016 Bill Yu. All rights reserved.
//

import Foundation

// /foods/
class Food: Serializable {
    var name = ""
    var price = 0.0
    
    required init?(fromString: String) {
        let elements = fromString.components(separatedBy: "|")
        if (elements.count != 2) {
            return nil
        }
        name = elements[0]
        guard let p = elements[1].toDouble()
            else { return nil }
        price = p
    }
    
    func equals(other: Food) -> Bool {
        return price == other.price && name == other.name
    }
    
    func toString() -> String {
        return name + "|" + price.description
    }
}
