//
//  LoginViewController.swift
//  Discover
//  Created by Natalie Murillo on 7/21/17.
//  Copyright © 2017 Natalie Murillo. All rights reserved.
import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase

typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController {
    

    
//login
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

//signup
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBAction func createUsername(_sender: AnyObject) {
        
        
        if let email = self.emailTextField.text, let password = self.passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                
                if (error == nil) {
                   print("Congratulations on making an account on Discover!")
                    
                    self.performSegue(withIdentifier: "createAccountSegue", sender: nil)

                }
                else {
                    print(error)
                }

            })
        }
    }
  
    @IBAction func Login(_ sender: Any) {
        if let email = username.text, let password = password.text {
        Auth.auth().currentUser
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                print(error)
            } else {
                let userID: String = user!.uid
                self.navigationController?.popViewController(animated: true)
                print("Logged in")
                }
            })
        }
    }
    @IBAction func SignUp(_ sender: Any) {
        if let email = username.text, let password = password.text {
            Auth.auth().currentUser
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                
                if error != nil {
                    print(error)
                } else {
                    let userID: String = user!.uid
                    self.navigationController?.popViewController(animated: true)
                    print("Created an Account")
                }
            })
        }
    }

}
