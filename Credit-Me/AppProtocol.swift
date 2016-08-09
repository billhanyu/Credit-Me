//
//  OnlineObject.swift
//  Credit-Me
//
//  Created by Bill Yu on 8/9/16.
//  Copyright © 2016 Bill Yu. All rights reserved.
//

import Foundation

protocol OnlineObject: class {
    func saveToFir() -> Bool
}

protocol Serializable: class {
    init? (fromString: String)
    func toString() -> String
}
