//
//  LoginViewController.swift
//  Discover
//
//  Created by Natalie Murillo on 7/21/17.
//  Copyright © 2017 Natalie Murillo. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
   //login
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
 //signup
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func createUsername(_sender: AnyObject) {
        
        if let email = self.emailTextField.text, let password = self.passwordTextField.text {
            
            Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                if (error == nil) {
                   print("Congratulations on making an account on Discover!")
                }else{
                    print(error)
                }

            })
        }
    }
  
    @IBAction func Login(_ sender: Any) {
        
        if let email = username.text, let password = password.text {
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                print(error)
            } else {
                print("Logged in")
            }
        })
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
