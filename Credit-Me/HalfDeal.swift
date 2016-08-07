//
//  HalfDeal.swift
//  Credit-Me
//
//  Created by Bill Yu on 8/7/16.
//  Copyright © 2016 Bill Yu. All rights reserved.
//

import Foundation

class HalfDeal {
    var duration = 0
    var priceBound = 0.0
    var user: AppUser?
    var isDeliver = false
    var time: Date?
    enum type {
        case deliver
        case meetup
    }
    
    func getTimeString() -> String? {
        return time?.description
    }
}
