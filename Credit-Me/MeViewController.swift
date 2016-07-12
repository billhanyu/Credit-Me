//
//  MeViewController.swift
//  Credit-Me
//
//  Created by Bill Yu on 7/11/16.
//  Copyright © 2016 Bill Yu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class MeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logout(_ sender: AnyObject) {
        try! FIRAuth.auth()!.signOut()
        let LoginVC = self.storyboard?.instantiateInitialViewController()
        self.present(LoginVC!, animated: true, completion: nil)
    }
}
