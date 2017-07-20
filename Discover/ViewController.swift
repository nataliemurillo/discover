//
//  ViewController.swift
//  Discover
//
//  Created by Natalie Murillo on 7/17/17.
//  Copyright © 2017 Natalie Murillo. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    

// ========== Variables ========== //
    @IBOutlet weak var mapViewController: MKMapView!
    let manager = CLLocationManager()
    var currentLocation:CLLocation?
    var currentLocationIsCorrect = false
    
// ========== IBActions ========== //
    @IBAction func handleLongPress(_ sender: Any) {
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = mapViewController.centerCoordinate
        annotation.title = "30 Dexter"
        annotation.subtitle = "PUT SOME RESPECT!!!"
        
        mapViewController.addAnnotation(annotation)
    }

    
    @IBAction func updateButtonTapped(_ sender: Any) {
        currentLocationIsCorrect = false
        
    }
    
// ========== View Lifecycle ========== //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
    
    }
    
// ========== Location Functions ========== //
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if currentLocationIsCorrect == false {
            currentLocation = locations[0]
            updateMap()
            currentLocationIsCorrect = true
        }
        
    }


    func updateMap() {
        if currentLocation != nil {
            let mapRegion:MKCoordinateRegion = MKCoordinateRegionMake(CLLocationCoordinate2DMake(currentLocation!.coordinate.latitude, currentLocation!.coordinate.longitude), MKCoordinateSpanMake(0.01, 0.01))
            mapViewController.setRegion(mapRegion, animated: true)
            
            self.mapViewController.showsUserLocation = true
        }
        
    }
    
}

extension ViewController: CLLocationManagerDelegate {
    
}
