//
//  MapVC.swift
//  ASS7
//
//  Created by MAC on 02/06/23.
//  Make an app to drop multiple pins on map.

import Foundation
import UIKit
import MapKit


class MapVC: UIViewController {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let Rannonation = MKPointAnnotation()
        Rannonation.coordinate = CLLocationCoordinate2D(latitude: 22.3039, longitude: 70.8022)
      //  Rannonation.coordinate = CLLocationCoordinate2D(latitude: 23.0225, longitude: 72.5714)
        
     //   mapView.addAnnotation(Rannonation)
        
        let Aannonation = MKPointAnnotation()
        Aannonation.coordinate = CLLocationCoordinate2D(latitude: 23.0225, longitude: 72.5714)
        
       
        
        mapView.addAnnotations([Rannonation, Aannonation])
        
    }
    
}
