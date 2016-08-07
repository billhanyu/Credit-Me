//
//  Eatery.swift
//  Credit-Me
//
//  Created by Bill Yu on 8/7/16.
//  Copyright © 2016 Bill Yu. All rights reserved.
//

import Foundation

// /eateries/
class Eatery {
    var id = ""
    var eateryName = ""
    var section = ""
    var start = 0
    var end = 0
    var description = ""
    
    func equals(other: Eatery) -> Bool {
        return id == other.id
    }
}
