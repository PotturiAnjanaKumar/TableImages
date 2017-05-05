//
//  MapViewController.swift
//  SampleService
//
//  Created by vsplash on 5/1/17.
//  Copyright © 2017 vsplash. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MapViewController: UIViewController,MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var selectedGroup:Group?

    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        super.viewDidLoad()
        self.mapView.delegate = self
        // Set map view delegate with controller
        self.mapView.delegate = self
        
        let str: String = (selectedGroup?.lat)!
        let str2: String = (selectedGroup?.lng)!
        
        let newYorkLocation = CLLocationCoordinate2DMake(Double(str)!, Double(str2)!)
        // Drop a pin
        let dropPin = MKPointAnnotation()
        dropPin.coordinate = newYorkLocation
        dropPin.title = "New York City"
        
        
        var region = MKCoordinateRegion()
        region.center.latitude = Double(str)!
        region.center.longitude = Double(str2)!
        //region.span.longitudeDelta = 0.15
        //region.span.latitudeDelta = 0.15
        self.mapView.setRegion(region, animated: true)
        mapView.addAnnotation(dropPin)

    }
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool)
    {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
