//
//  PinHelper.swift
//  Discover
//
//  Created by Natalie Murillo on 8/4/17.
//  Copyright © 2017 Natalie Murillo. All rights reserved.
//

import Foundation
import GeoFire
import FirebaseDatabase
import UIKit

struct PinHelper {
    
    private static let ref = Database.database().reference()
    private static let geofire = GeoFire(firebaseRef: ref.child("geofire"))
    
    static func savePin(pin: Pin) {
        geofire?.setLocation(pin.location, forKey: pin.pid)
        let pinRef = ref.child("pins").child(pin.pid)
        
        pinRef.setValue(pin.getDict())
    }
    static func getUniquePid() -> String {
        let pinRef = ref.child("pins")
        return pinRef.childByAutoId().key
    }
}
