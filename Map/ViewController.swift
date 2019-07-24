//
//  ViewController.swift
//  Map
//
//  Created by Deepson on 7/23/19.
//  Copyright © 2019 Deepson. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController {
    @IBOutlet weak var Map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let latitude:CLLocationDegrees = 42.863
        
        let longitude:CLLocationDegrees = -112.434
        let latDelta:CLLocationDegrees = 1
        let lonDelta:CLLocationDegrees = 1
        
        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        
        let region = MKCoordinateRegion(center: coordinates, span: span)
     Map.setRegion(region, animated: true)
        let annotation=MKPointAnnotation()
        annotation.title="University Address"
        annotation.subtitle="I will graduate soon"
        annotation.coordinate=coordinates
        Map.addAnnotation(annotation)
        let uilgr = UILongPressGestureRecognizer(target: self, action:#selector(ViewController.longpress(gestureRecognizer:)))
        uilgr.minimumPressDuration=0.5
        Map.addGestureRecognizer(uilgr)
    }
    @objc func longpress(gestureRecognizer: UILongPressGestureRecognizer){
        var touchpoint = gestureRecognizer.location(in: Map)
        var newCoordinates = Map.convert(touchpoint, toCoordinateFrom: self.Map)
        let annotation=MKPointAnnotation()
        annotation.coordinate=newCoordinates
        annotation.title="New Place"
        Map.addAnnotation(annotation)
    }
    

}

