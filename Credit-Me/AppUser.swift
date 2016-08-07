//
//  User.swift
//  Credit-Me
//
//  Created by Bill Yu on 8/6/16.
//  Copyright © 2016 Bill Yu. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseAuth

class AppUser {
    
    var isBrownUser: Bool = false
    var name = ""
    var email = ""
    var totalRating = 0
    var ratingNum = 0
    var gender = "Secret"
    var contact = "0000000000"
    var subscribe = false
    var password = ""
    var lastComment = "No last comment"
    var firInstance: FIRUser!
    
    init(instance: FIRUser!) {
        firInstance = instance
        email = instance.email!
        if let n = instance.displayName {
            name = n
        } else {
            let range = email.range(of: "@")!
            name = email.substring(with: email.startIndex..<range.lowerBound)
        }
    }
    
    func saveToFir() {
        //database
        let ref = FIRDatabase.database().reference()
        let users = ref.child("users")
        let userValue = [
            "name": name,
            "email": email,
            "isBrownUser": isBrownUser,
            "gender": gender,
            "totalRating": totalRating,
            "ratingNum": ratingNum,
            "contact": contact,
            "subscribe": subscribe,
            "lastComment": lastComment
        ]
        users.child(firInstance.uid).setValue(userValue)
        
        //auth
        let changeRequest = firInstance.profileChangeRequest()
        changeRequest.displayName = name
        changeRequest.commitChanges(completion: nil)
    }
}
