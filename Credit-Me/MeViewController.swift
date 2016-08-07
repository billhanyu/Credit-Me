//
//  MeViewController.swift
//  Credit-Me
//
//  Created by Bill Yu on 7/11/16.
//  Copyright © 2016 Bill Yu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class MeViewController: UITableViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    let nameTag = 0
    let phoneTag = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = AppStatus.user.name
        nameTextField.tag = nameTag
        
        phoneTextField.text = "loading~"
        let ref = FIRDatabase.database().reference()
        ref.child("users").child(AppStatus.user.firInstance.uid).observeSingleEvent(of: .value) { (snapshot) in
            self.phoneTextField.text = snapshot.value!["contact"] as? String
        }
        phoneTextField.tag = phoneTag
        
        nameTextField.delegate = self
        phoneTextField.delegate = self
    }
    
    func logout() {
        try! FIRAuth.auth()!.signOut()
        let LoginVC = self.storyboard?.instantiateInitialViewController()
        self.present(LoginVC!, animated: true, completion: nil)
    }
}

extension MeViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        updateInfo()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        updateInfo()
        return true
    }
    
    func updateInfo() {
        AppStatus.user.name = nameTextField.text!
        AppStatus.user.contact = phoneTextField.text!
        AppStatus.user.saveToFir()
    }
}

extension MeViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            logout()
        }
    }
}
