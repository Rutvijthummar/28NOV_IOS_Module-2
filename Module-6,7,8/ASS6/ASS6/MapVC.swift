//
//  MapVC.swift
//  ASS6
//
//  Created by MAC on 02/06/23.
//   Make an app to add map using Map kit.

import Foundation
import UIKit
import MapKit
import CoreLocation


class MapVC: UIViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var mapControl: MKMapView!
    
    var locationMngr=CLLocationManager()
    
    let newPin = MKPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  
    
    @IBAction func segmentTapped(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex==0
        {
            mapControl.mapType = .standard
        }
        if sender.selectedSegmentIndex==1
        {
            mapControl.mapType = .satellite
        }
        if sender.selectedSegmentIndex==2
        {
            mapControl.mapType = .hybrid
        }
        
    }
}
