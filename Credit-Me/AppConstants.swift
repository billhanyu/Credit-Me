//
//  AppConstants.swift
//  Credit-Me
//
//  Created by Bill Yu on 7/11/16.
//  Copyright © 2016 Bill Yu. All rights reserved.
//

import Foundation
import UIKit

struct StoryboardID {
    static let LOGINVC = "LoginViewController"
}

struct SegueID {
    static let LOGINtoMAIN = "LoginToMain"
    static let PICK_EATERY = "PickEaterySegue"
}

enum MeetType {
    case meet
    case deliver
}
