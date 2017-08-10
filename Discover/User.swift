//
//  User.swift
//  Discover
//
//  Created by Natalie Murillo on 7/27/17.
//  Copyright © 2017 Natalie Murillo. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase



class User:  NSObject {
    let uid: String
    let username: String
    private static var _current: User?
    
    static var current: User {
    
        guard let currentUser = _current else{
            fatalError("error: current user doesn't exist")
        }
        return currentUser
    }
    init(uid:String, username: String) {
        self.uid = uid
        self.username = username
    }
    
    init? (snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
        let username = dict["username"] as? String
            else {return nil}
        self.uid = snapshot.key
        self.username = username
    }
    
    func userDict() -> [String: Any] {
        var dict = [String : Any]()
        dict["username"] = self.username
        return dict
    }
    
    
    class func isUserLoggedIn() -> Bool {
        return Auth.auth().currentUser != nil
    }
    
    class func setCurrent(_current: User){
        self._current = _current
    }
   
}
