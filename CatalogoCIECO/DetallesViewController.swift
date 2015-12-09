//
//  DetallesViewController.swift
//  CatalogoCIECO
//
//  Created by Adalid Ramirez on 03/08/15.
//  Copyright (c) 2015 Luis Manuel Rodriguez Ramirez. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation

class DetallesViewController: UIViewController, CLLocationManagerDelegate {
    
    
    
    var nombreCientificoSegue: String?
    @IBOutlet weak var nombreCientifico: UILabel!
    @IBOutlet weak var nombreComun: UILabel!
    @IBOutlet weak var clase: UILabel!
    @IBOutlet weak var subclase: UILabel!
    @IBOutlet weak var familia: UILabel!
    @IBOutlet weak var superorden: UILabel!
    @IBOutlet weak var orden: UILabel!
    @IBOutlet weak var genero: UILabel!
    @IBOutlet weak var referencias: UILabel!
    @IBOutlet weak var catalogo: UILabel!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var latitud: UILabel!
    @IBOutlet weak var longitud: UILabel!
    @IBOutlet weak var aforo: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    let locationManager = CLLocationManager()
    
    let moContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var especies = [Especie]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
         aforo.text = Int(self.slider.value).description
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = 20
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        var error: NSError?
        let request = NSFetchRequest(entityName: "Especie")
        
        let predicate = NSPredicate(format: "nombreCientifico == %@", nombreCientificoSegue!)
        
        request.predicate = predicate
        
        especies = moContext?.executeFetchRequest(request, error: &error) as! [Especie]
        
        nombreCientifico.text = self.especies[0].nombreCientifico
        nombreComun.text = "\(nombreComun.text!) \(self.especies[0].nombreComun)"
        clase.text = "\(clase.text!) \(self.especies[0].clase)"
        subclase.text = "\(subclase.text!) \(self.especies[0].subclase)"
        familia.text = "\(familia.text!) \(self.especies[0].familia)"
        superorden.text = "\(superorden.text!) \(self.especies[0].superorden)"
        orden.text = "\(orden.text!) \(self.especies[0].orden)"
        genero.text = "\(genero.text!) \(self.especies[0].genero)"
        referencias.text = "\(referencias.text!) \(self.especies[0].referencias)"
        catalogo.text = "\(catalogo.text!)"
        
        img1.image = UIImage(data: self.especies[0].imagen1)
        img2.image = UIImage(data: self.especies[0].imagen2)
        img3.image = UIImage(data: self.especies[0].imagen3)
        img4.image = UIImage(data: self.especies[0].imagen4)
        
        // Do any additional setup after loading the view.
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

    @IBAction func sliderChange(sender: UISlider) {
        if(Int(self.slider.value) == 100){
            aforo.text = Int(self.slider.value).description + " o más"
        }
        else{
            aforo.text = Int(self.slider.value).description
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
