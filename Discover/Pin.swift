//
//  savePins.swift
//  Discover
//
//  Created by Natalie Murillo on 7/31/17.
//  Copyright © 2017 Natalie Murillo. All rights reserved.
//

import Foundation
import CoreLocation

class Pin {
    let location: CLLocation
    let pid: String
    let uid: String
    
    init(location: CLLocation, pinID: String, userID: String) {
        self.location = location
        self.pid = pinID
        self.uid = userID
    }
    
    init(location: CLLocation) {
        self.location = location
        self.pid = PinHelper.getUniquePid()
        self.uid = User.current.uid
    }
    
    func getDict() -> [String: Any] {
        var dict = [String : Any]()
        
        dict["pid"] = self.pid
        dict["uid"] = self.uid
        dict["lat"] = self.location.coordinate.latitude
        dict["long"] = self.location.coordinate.longitude
        
//        dict["key"] = value
        return dict
    }
}
