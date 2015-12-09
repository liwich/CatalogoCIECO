//
//  RegistrarEspecieViewController.swift
//  menuChido
//
//  Created by Adalid Ramirez on 17/07/15.
//  Copyright (c) 2015 Adalid Ramirez. All rights reserved.
//

import UIKit
import CoreLocation


class RegistrarEspecieViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    
    @IBOutlet weak var longitud: UILabel!
    @IBOutlet weak var latitud: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Prepare the location manager
        locationManager.delegate = self
        locationManager.desiredAccuracy = 20
        // Need to ask for the right permissions
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showMenu(sender: AnyObject) {
        toggleSideMenuView()
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        if let location = locations.first as? CLLocation {
            // Update the fields as expected:
            latitud.text = "\(location.coordinate.latitude)"
            longitud.text = "\(location.coordinate.longitude)"
            //altValLabel.text = "\(location.altitude) m"
            //accValLabel.text = "\(location.horizontalAccuracy) m"
            //spdValLabel.text = "\(location.speed) ms⁻¹"
            // Re-center the map
            //mapView.centerCoordinate = location.coordinate
            // And update the track on the map
            //historicalPoints.append(location.coordinate)
            //updateMapWithPoints(historicalPoints)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
