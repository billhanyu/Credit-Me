//
//  HalfDealObject.swift
//  Credit-Me
//
//  Created by Bill Yu on 8/7/16.
//  Copyright © 2016 Bill Yu. All rights reserved.
//

import Foundation

class HalfDealObject {
    var eatery = ""
    var time: String?
    var duration = 0
    var location = ""
    var center = false
    var north = false
    var south = false
    var userName = ""
    var actualPrice = 0.0
    var priceBound = 0.0
    var creditNum = 0
    var deliver = false
    
    init (offer: Offer) {
        let eateries = offer.eatery
        for e in eateries {
            eatery += ", " + e.eateryName
        }
        let range = eatery.startIndex...eatery.index(after: eatery.startIndex)
        eatery.removeSubrange(range)
        time = offer.getTimeString()
        duration = offer.duration / 600000
        deliver = offer.isDeliver
    }
}
