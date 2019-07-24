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
        let latitude:CLLocationDegrees = 42.9
        
        let longitude:CLLocationDegrees = -112.42
        let latDelta:CLLocationDegrees = 0.05
        let lonDelta:CLLocationDegrees = 0.05
        
        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        
        let region = MKCoordinateRegion(center: coordinates, span: span)
     Map.setRegion(region, animated: true)
    }


}

