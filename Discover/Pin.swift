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
    
    init(location: CLLocation, pinID: String) {
        self.location = location
        self.pid = pinID
    }
    
    init(location: CLLocation) {
        self.location = location
        self.pid = PinHelper.getUniquePid()
    }
    
//    var dictValue: [String : Any] {
//        
//    }
    
    
}
