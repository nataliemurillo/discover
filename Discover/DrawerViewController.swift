//
//  DrawerViewController.swift
//  Discover
//
//  Created by Natalie Murillo on 7/19/17.
//  Copyright © 2017 Natalie Murillo. All rights reserved.
//

import UIKit
import Firebase

class DrawerViewController: UIViewController {

    @IBAction func signOut(_ sender: UIButton) {
        
        do {
            try(Auth.auth().signOut())
            print("User Signed Out")

        } catch _ {
        
    }
}
    
    @IBOutlet weak var drawerTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func handleLogout() {
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
