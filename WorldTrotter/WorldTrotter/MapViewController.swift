//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by hongtao on 16/2/22.
//  Copyright © 2016年 floodliu. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    override func loadView() {
        mapView = MKMapView()
        view = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("MapViewController loaded its view.")
    }
}
