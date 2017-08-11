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
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

//signup
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!

    @IBAction func createUsername(_sender: AnyObject) {
        
        
        if let email = self.emailTextField.text, let password = self.passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                
                if (error == nil) {
                   print("Congratulations on making an account on Discover!")
                    self.dismiss(animated: true, completion: { 
                        self.dismiss(animated: true, completion: nil)
                    })
                    
                    //self.performSegue(withIdentifier: "createAccountSegue", sender: nil)

                }
                else {
                    print(error)
                }

            })
        }
    }
  
    @IBAction func login(_ sender: Any) {
        if let email = username.text, let password = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                
                if error != nil {
                    print(error)
                } else {
                    let userID: String = user!.uid
                    UserService.showUser(forUID: userID, completion: { (FBuser) in
                        if let FBuser = FBuser {
                            User.setCurrent(_current: FBuser)
                            self.navigationController?.popViewController(animated: true)
                            print("Logged in")
                        }
                    })
                }
            })
        }
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text, let username = usernameTextField.text {
            Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                
                if error != nil {
                    print(error)
                } else {
                  
                    let uid: String = user!.uid
                    UserService.createUser(user!, username: username, completion: { (FBuser) in
                        if let FBuser = FBuser {
                            User.setCurrent(_current: FBuser)
                            self.navigationController?.popViewController(animated: true)
                            print("Created an Account")
                        }
                    })
              
                }
            })
        }

    }

}
