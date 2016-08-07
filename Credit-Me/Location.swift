//
//  Location.swift
//  Credit-Me
//
//  Created by Bill Yu on 8/7/16.
//  Copyright © 2016 Bill Yu. All rights reserved.
//

import Foundation

// /locations/
class Location {
    var id = ""
    var name = ""
    var section = ""
    
    func equals(other: Location) -> Bool {
        return id == other.id && name == other.name && section == other.section
    }
}
