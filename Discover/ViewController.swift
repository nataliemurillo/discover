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

    @IBOutlet weak var mapViewController: MKMapView!
    
    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        let mapSpan:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let mapRegion:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, mapSpan)
        mapViewController.setRegion(mapRegion, animated: true)
        
        self.mapViewController.showsUserLocation = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
//        
//        let mapSpan:MKCoordinateSpan = MKCoordinateSpanMake(centerLocation.coordinate.latitude, centerLocation.coordinate.longitude)
//        let centerLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(37.812643, -122.2663986)
//        let mapRegion:MKCoordinateRegion = MKCoordinateRegionMake(centerLocation, mapSpan)
//        mapViewController.setRegion(mapRegion, animated: true)
//        
//        let annotation = MKPointAnnotation()
//        
//        annotation.coordinate = centerLocation
//        annotation.title = "AYOOOOO"
//        annotation.subtitle = "it works!!!!!!!"
//        mapViewController.addAnnotation(annotation)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}

extension ViewController: CLLocationManagerDelegate {
    
}
