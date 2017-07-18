//
//  ViewController.swift
//  Discover
//
//  Created by Natalie Murillo on 7/17/17.
//  Copyright © 2017 Natalie Murillo. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapViewController: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mapSpan:MKCoordinateSpan = MKCoordinateSpanMake(00.1, 00.1)
        let centerLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(37.812643, -122.2663986)
        let mapRegion:MKCoordinateRegion = MKCoordinateRegionMake(centerLocation, mapSpan)
        mapViewController.setRegion(mapRegion, animated: true)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = centerLocation
        annotation.title = "AYOOOOO"
        annotation.subtitle = "it works!!!!!!!"
        mapViewController.addAnnotation(annotation)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

