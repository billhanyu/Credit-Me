//
//  LoginViewController.swift
//  Credit-Me
//
//  Created by Bill Yu on 7/11/16.
//  Copyright © 2016 Bill Yu. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    func initUI() {
        passwordTextField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        FIRAuth.auth()?.addStateDidChangeListener({ (auth, user) in
            if let _ = user {
                print("already logged in")
                self.performSegue(withIdentifier: SegueID.LOGINtoMAIN, sender: nil)
            }
            else {
                // log in now
            }
        })
    }
    
    @IBAction func login(_ sender: AnyObject) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            if let _ = user {
                print("sing in success")
                self.performSegue(withIdentifier: SegueID.LOGINtoMAIN, sender: nil)
            }
            else {
                print("email or password incorrect")
            }
            if let error = error {
                print("Error signing in: ", error)
            }
        })
    }
    
    @IBAction func signup(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Register",
                                      message: "Register",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Sign Up", style: .default) { (action: UIAlertAction!) -> Void in
            
            let emailField = alert.textFields![0]
            let passwordField = alert.textFields![1]
            
            FIRAuth.auth()?.createUser(withEmail: emailField.text!, password: passwordField.text!, completion: { (user, error) in
                if error == nil {
                    print("create user successful")
                    FIRAuth.auth()?.signIn(withEmail: emailField.text!, password: passwordField.text!, completion: { (user, error) in
                    })
                }
                if let error = error {
                    print("create user error: ", error)
                    print(error.userInfo[NSLocalizedFailureReasonErrorKey])
                    print(error.userInfo[NSUnderlyingErrorKey])
                }
            })
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .default) { (action: UIAlertAction!) -> Void in
        }
        
        alert.addTextField { (textEmail) in
            textEmail.placeholder = "Enter your email"
            textEmail.keyboardType = .emailAddress
        }
        
        alert.addTextField { (textPassword) -> Void in
            textPassword.isSecureTextEntry = true
            textPassword.placeholder = "Enter your password"
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        login(self)
        return false
    }
}
