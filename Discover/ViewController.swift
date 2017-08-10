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
import Firebase
import Foundation
class ViewController: UIViewController{
    
var pins = [Pin]()

// ========== Variables ========== //
    @IBOutlet weak var mapViewController: MKMapView!
    let manager = CLLocationManager()
    var currentLocation:CLLocation?
    var currentLocationIsCorrect = false
    var handle: AuthStateDidChangeListenerHandle?
    
    func longPressed(sender: UILongPressGestureRecognizer) {
        //print(Auth.auth().currentUser?.email)
        let touchLocation = sender.location(in: mapViewController)
        let coordinate = mapViewController.convert(touchLocation, toCoordinateFrom: mapViewController)
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        if(Auth.auth().currentUser != nil) {
            //createPin(sender: sender)
            createPinRequestAlert(title: "Are You Sure You Want To Create A Pin Here?", message: "", location: location)
 
        } else {
            let alertController = UIAlertController(title: nil, message:
                "Sorry! You must sign in if you want to create a pin!", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil
        )}
    }
    
    func createPin(location: CLLocation) {
        let annotation = CustomPointAnnotation()
        let pin1 = Pin(location: location)
        PinHelper.savePin(pin: pin1)
        annotation.coordinate = location.coordinate
        annotation.title = "You Have Made an Annotation"
        annotation.subtitle = "Congrats!"
        annotation.pin = pin1
        self.mapViewController.addAnnotation(annotation)

    }
    
    // make another alert for anonymous users to sign in if they want to create a pin!!!
    
    func createPinRequestAlert (title: String, message:String, location: CLLocation) {
        if(Auth.auth().currentUser != nil) {
            let alertController = UIAlertController(title: nil, message:
                "Are You Sure You Want To Create A Pin Here?", preferredStyle: UIAlertControllerStyle.alert)
            //CREATING ONE BUTTON
            alertController.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: { (action) in
                //create and add pin here
                //alertController.dismiss(animated: true, completion: nil)
                print("YES")
                self.createPin(location: location)
                
            }))

            alertController.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: { (action) in
                alertController.dismiss(animated: true, completion: nil)
                print("NO")
                
            }))
            
            self.present(alertController, animated: true, completion: nil)
        
        } else {
            
        }
    }
// delete an annotation 
    func deletePins(sender: UILongPressGestureRecognizer) {
        if (Auth.auth().currentUser != nil) {
        let annotations = self.mapViewController.annotations
        for _annotation in annotations {
            self.mapViewController.removeAnnotation(_annotation)
        }
        
        } else {
            
        }
    }
    
    @IBAction func updateButtonTapped(_ sender: Any) {
        currentLocationIsCorrect = false
        
    }
    
// ========== View Lifecycle ========== //
    override func viewDidLoad() {
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPressed(sender:)))
        self.view.addGestureRecognizer(longPressRecognizer)
        super.viewDidLoad()
        mapViewController.delegate = self
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
    
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
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

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("Hey that's an annotation view")
    }
}
