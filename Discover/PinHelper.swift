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
    private static var regionQuery : GFQuery?
    
    static func savePin(pin: Pin) {
        geofire?.setLocation(pin.location, forKey: pin.pid)
        let pinRef = ref.child("pins").child(pin.pid)
        
        pinRef.setValue(pin.getDict())
    }
    static func getUniquePid() -> String {
        let pinRef = ref.child("pins")
        return pinRef.childByAutoId().key
    }
    
    static func getPin(pid: String, completion: @escaping (Pin?) -> Void) {
        let pidRef = ref.child("pins").child(pid)
        pidRef.observeSingleEvent(of: .value, with: { (snapshot) in
            
            var pin = Pin(snapshot: snapshot)
            
            completion(pin)
        })
    }
    static func deletePin(pid: String) {
        let pinRef = ref.child("pins").child(pid)
        let pinGeoFireRef = ref.child("geofire").child(pid)
        
        pinRef.setValue(NSNull())
        pinGeoFireRef.setValue(NSNull())
        
    }
    static func startPinObserver(for region: MKCoordinateRegion, with completion: @escaping (Pin) -> Void) {
        if (regionQuery != nil || !User.doesUserExist()) {
//            fatalError("DONT MAKE A NEW ONE WHEN IT ALREADY EXISTS")
        } else {
            regionQuery = geofire?.query(with: region)
            regionQuery?.observe(.keyEntered, with: { (pid, location) in
                guard let pid = pid,
                    let location = location else { return }
                getPin(pid: pid, completion: { (pin) in
                    
                    guard let pin = pin else{ return }
                    completion(pin)
                    
                })
            })
        }
        
        
    }
}
