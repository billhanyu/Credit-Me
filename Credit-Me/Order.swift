//
//  Order.swift
//  Credit-Me
//
//  Created by Bill Yu on 8/7/16.
//  Copyright © 2016 Bill Yu. All rights reserved.
//

import Foundation

// /orders/
class Order: HalfDeal {
    var orders: [Food] = []
    var actualPrice = 0.0
    var location: Location?
    var eatery: Eatery?
}
