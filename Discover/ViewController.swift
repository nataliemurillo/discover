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
        
        let centerLocation: CLLocationCoordinate2DMake = CLLocationCoordinate2DMake(37.812643, -122.2663986)
        
        let mapSpan: MKCoordinateSpanMake = MKCoordinateSpan(00.1, 00.1)
        
         var mapRegion = MKCoordinateRegionMake(centerLocation, mapSpan)
        
        self.mapViewController.setRegion(mapRegion, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

