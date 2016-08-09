//
//  Eatery.swift
//  Credit-Me
//
//  Created by Bill Yu on 8/7/16.
//  Copyright © 2016 Bill Yu. All rights reserved.
//

import Foundation

// /eateries/
class Eatery: Serializable {
    var id = ""
    var eateryName = ""
    var section = ""
    var start: Int = 0
    var end: Int = 0
    var description = ""
    
    required init?(fromString: String) {
        let elements = fromString.components(separatedBy: "|")
        if (elements.count != 6) { return nil }
        id = elements[0]
        eateryName = elements[1]
        section = elements[2]
        guard let s = elements[3].toInt() else { return nil }
        start = s
        guard let e = elements[4].toInt() else { return nil }
        end = e
        description = elements[5]
    }
    
    func equals(other: Eatery) -> Bool {
        return id == other.id
    }
    
    func toString() -> String {
        return id + "|" + eateryName + "|" + section + "|" + start.description + "|" + end.description + "|" + description
    }
}
