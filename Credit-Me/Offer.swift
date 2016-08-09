//
//  Offer.swift
//  Credit-Me
//
//  Created by Bill Yu on 8/7/16.
//  Copyright © 2016 Bill Yu. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

// /offers/
class Offer: HalfDeal, OnlineObject {
    var creditNum = 0
    var locations: [Location] = []
    var eateries: [Eatery] = []
    
    func saveToFir() -> Bool {
        var locationsSerialized: [String] = []
        var eateriesSerialized: [String] = []
        for location in locations {
            locationsSerialized.append(location.toString())
        }
        for eatery in eateries {
            eateriesSerialized.append(eatery.toString())
        }
        
        let ref = FIRDatabase.database().reference().child("offers")
        let offer = ref.childByAutoId()
        let offerValue = [
            "creditNum": creditNum,
            "locations": locationsSerialized,
            "eateries": eateriesSerialized
        ]
        offer.setValue(offerValue)
        return true
    }
}
