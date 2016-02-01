//
//  ViewController.swift
//  KefLatAndLongFromAddress
//
//  Created by Franks, Kent on 1/20/16.
//  Copyright © 2016 Franks, Kent. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var locationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func getLatAndLong() {
//        
//        let address = "3116 Valentine Ln, NC, USA"
//        let geocoder = CLGeocoder()
//        geocoder.geocodeAddressString(address, completionHandler: {(placemarks: [CLPlacemark]?, error: NSError?) -> Void in
//            let placemark = placemarks![0]
//            let lat = placemark.location!.coordinate.latitude
//            let long = placemark.location!.coordinate.longitude
//            print("lat = \(lat), long = \(long)")
//        })
//    }
    
    @IBAction func getLocation(sender: AnyObject) {
        let coordinates = getLatAndLong(locationTextField.text!)
        print("coordinates = \(coordinates)")
    }
    
    
    func getLatAndLong(address: String) -> (Double, Double) {
        
        let geocoder = CLGeocoder()
        var letAndLong: (Double, Double) = (0.0, 0.0)
        geocoder.geocodeAddressString(address, completionHandler: {(placemarks: [CLPlacemark]?, error: NSError?) -> Void in
            let placemark = placemarks![0]
            letAndLong = (placemark.location!.coordinate.latitude, placemark.location!.coordinate.longitude)
        })
        return letAndLong
        
    }



}

