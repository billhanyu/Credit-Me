//
//  Deal.swift
//  Credit-Me
//
//  Created by Bill Yu on 8/7/16.
//  Copyright © 2016 Bill Yu. All rights reserved.
//

import Foundation

// /deals/
class Deal {
    var buyerRating = -1
    var sellerRating = -1
    var complete = false
    var buyerComment = "No comment yet."
    var sellerComment = "No comment yet."
    var offer: Offer?
    var order: Order?
    var price = 0.0
    var time = ""
}
