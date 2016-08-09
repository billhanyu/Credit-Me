//
//  Location.swift
//  Credit-Me
//
//  Created by Bill Yu on 8/7/16.
//  Copyright © 2016 Bill Yu. All rights reserved.
//

import Foundation

// /locations/
class Location: Serializable {
    var id = ""
    var name = ""
    var section = ""
    
    required init?(fromString: String) {
        let elements = fromString.components(separatedBy: "|")
        if (elements.count != 3) {
            return nil
        }
        id = elements[0]
        name = elements[1]
        section = elements[2]
    }
    
    func equals(other: Location) -> Bool {
        return id == other.id && name == other.name && section == other.section
    }
    
    func toString() -> String {
        return id + "|" + name + "|" + section
    }
}
