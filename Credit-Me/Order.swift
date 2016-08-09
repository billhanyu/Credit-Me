//
//  Order.swift
//  Credit-Me
//
//  Created by Bill Yu on 8/7/16.
//  Copyright © 2016 Bill Yu. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

// /orders/
class Order: HalfDeal, OnlineObject {
    var foods: [Food] = []
    var actualPrice = 0.0
    var location: Location?
    var eatery: Eatery?
    
    func saveToFir() -> Bool {
        guard let loc = location else { return false }
        guard let eat = eatery else { return false }
        var foodsSerialized: [String] = []
        for food in foods {
            foodsSerialized.append(food.toString())
        }
        
        let ref = FIRDatabase.database().reference().child("orders")
        let order = ref.childByAutoId()
        let orderValue = [
            "foods": foodsSerialized,
            "actualPrice": actualPrice,
            "location": loc,
            "eatery": eat
        ]
        order.setValue(orderValue)
        return true
    }
}
