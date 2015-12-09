//
//  CatalogosDisponiblesViewController.swift
//  menuChido
//
//  Created by Adalid Ramirez on 17/07/15.
//  Copyright (c) 2015 Adalid Ramirez. All rights reserved.
//

import UIKit
import CoreData

class CatalogosDisponiblesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, APIControllerProtocol{
    let moContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var tableData = []
    let kCellIdentifier : String = "SearchResultCell"
    let api = APIController()
    @IBOutlet weak var appsTableView: UITableView!
    @IBOutlet weak var urlText: UITextField!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buscarCatalogo(sender: AnyObject) {
        var url : String = urlText.text
        api.delegate = self
        api.searchItunesFor("Angry Birds")
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyTestCell")
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier) as! UITableViewCell
        
        if let rowData: NSDictionary = self.tableData[indexPath.row] as? NSDictionary,
            // Grab the artworkUrl60 key to get an image URL for the app's thumbnail
            //urlString = rowData["artworkUrl60"] as? String,
            // Create an NSURL instance from the String URL we get from the API
            //imgURL = NSURL(string: urlString),
            // Get the formatted price string for display in the subtitle
            //formattedPrice = rowData["formattedPrice"] as? String,
            // Download an NSData representation of the image at the URL
            //imgData = NSData(contentsOfURL: imgURL),
            // Get the track name
            trackName = rowData["tipo_es"] as? String {
                // Get the formatted price string for display in the subtitle
                //cell.detailTextLabel?.text = formattedPrice
                // Update the imageView cell to use the downloaded image data
                //cell.imageView?.image = UIImage(data: imgData)
                // Update the textLabel text to use the trackName from the API
                cell.textLabel?.text = trackName
                
        }
        return cell
    }
    
    
    func didReceiveAPIResults(results: NSArray) {
        dispatch_async(dispatch_get_main_queue(), {
            self.tableData = results
            self.appsTableView!.reloadData()
        })
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Get the row data for the selected row
        if let rowData = self.tableData[indexPath.row] as? NSDictionary,
            // Get the name of the track for this row
            name = rowData["tipo_es"] as? String,
            // Get the price of the track on this row
            formattedPrice = rowData["tipo_es"] as? String {
                descargarCatalogo(name)
                let alert = UIAlertController(title: "", message: "Descargando...", preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    
    
    
    func descargarCatalogo(tipo: String){
        
        //cambiar por urlText
        //var endpoint = NSURL(string: "http://localhost/delfin/index.php/android_con/descargar_cat_ios/\(tipo)")
        //var imageURL = "http://localhost/delfin/img/uploads/\(tipo)/"
        
        var endpoint = NSURL(string: "http://10.10.0.200/delfin/index.php/android_con/descargar_cat_ios/\(tipo)")
        var imageURL = "http://10.10.0.200/delfin/img/uploads/\(tipo)/"
        var data = NSData(contentsOfURL: endpoint!)
        
        
        
        if let json: NSDictionary = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary {
            //if let items = json["catalogo"] as? NSArray {
            if let items = json["$tipo"] as? NSArray {
                var counter = 0
                for item in items {
                    
                    var especieDescription = NSEntityDescription.entityForName("Especie", inManagedObjectContext: moContext!)
                    var especie = Especie(entity: especieDescription!, insertIntoManagedObjectContext: moContext)
                    
                    var clase   = items[counter]["clase"] as! String
                    var familia = items[counter]["familia"] as! String
                    var genero  = items[counter]["genero"] as! String
                    var imagen_1 = items[counter]["imagen_1"] as! String
                    var imagen_2 = items[counter]["imagen_2"] as! String
                    var imagen_3 = items[counter]["imagen_3"] as! String
                    var imagen_4 = items[counter]["imagen_4"] as! String
                    var nombre_cientifico = items[counter]["nombre_cientifico"] as! String
                    var nombre_comun = items[counter]["nombre_comun"] as! String
                    var orden = items[counter]["orden"] as! String
                    var referencias = items[counter]["referencias"] as! String
                    var subclase = items[counter]["subclase"] as! String
                    var superorden = items[counter]["superorden"] as! String
                    var tipo_es = items[counter]["tipo_es"] as! String
                    
                    especie.clase = clase
                    especie.familia = familia
                    especie.genero = genero
                    especie.nombreCientifico = nombre_cientifico
                    especie.nombreComun = nombre_comun
                    especie.orden = orden
                    especie.referencias = referencias
                    especie.subclase = subclase
                    especie.superorden = superorden
                    especie.tipoEs = tipo_es
                    
                    var image: NSURL!
                    
                    if imagen_1 != "" {
                        image = NSURL(string: imageURL + "" + imagen_1)!
                        especie.imagen1 = NSData(contentsOfURL: image)!
                    }
                    
                    if imagen_2 != "" {
                    image = NSURL(string: imageURL + "" + imagen_2)!
                       
                    especie.imagen2 = NSData(contentsOfURL: image)!
                    }
                    
                    if imagen_3 != "" {
                    image = NSURL(string: imageURL + "" + imagen_3)!
                    especie.imagen3 = NSData(contentsOfURL: image)!
                    }
                    
                    if imagen_4 != "" {
                    image = NSURL(string: imageURL + "" + imagen_4)!
                    especie.imagen4 = NSData(contentsOfURL: image)!
                    }
                    
                    
                    var error: NSError?
                    
                    moContext?.save(&error)
                    
                    counter++
                }
            }
        }
    
    }


}
