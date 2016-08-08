//
//  AppFunc.swift
//  Credit-Me
//
//  Created by Bill Yu on 8/6/16.
//  Copyright © 2016 Bill Yu. All rights reserved.
//

import Foundation
import UIKit

func /(lhs: CGFloat, rhs: Int) -> CGFloat {
    return lhs / CGFloat(rhs)
}

class AppFunc {
    static func showAlert(controller: UIViewController, title: String = "alert", message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alertController.addAction(dismissAction)
        controller.present(alertController, animated: true, completion: nil)
    }
}
