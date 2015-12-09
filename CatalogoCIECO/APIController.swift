//
//  APIController.swift
//  jsonChido
//
//  Created by Adalid Ramirez on 22/07/15.
//  Copyright (c) 2015 Luis Rodriguez. All rights reserved.
//

import Foundation

protocol APIControllerProtocol {
    func didReceiveAPIResults(results: NSArray)
}

class APIController{
    var delegate: APIControllerProtocol?

    func searchItunesFor(urlRemote: String) {
        // The iTunes API wants multiple terms separated by + symbols, so replace spaces with + signs
        //let itunesSearchTerm = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
        var itunesSearchTerm = ""
        // Now escape anything else that isn't URL-friendly
        if let escapedSearchTerm = itunesSearchTerm.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding) {
            //let urlPath = "http://itunes.apple.com/search?term=\(escapedSearchTerm)&media=software"
            let urlPath = "http://10.10.0.200/delfin/index.php/android_con/descargar_tipo_cat_ios"
            //let urlPath = "http://localhost/delfin/index.php/android_con/descargar_tipo_cat_ios" // Cambiar por urlRemote
            let url = NSURL(string: urlPath)
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
                println("Task completed")
                if(error != nil) {
                    // If there is an error in the web request, print it to the console
                    println(error.localizedDescription)
                }
                var err: NSError?
                if let jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as? NSDictionary {
                    if(err != nil) {
                        // If there is an error parsing JSON, print it to the console
                        println("JSON Error \(err!.localizedDescription)")
                    }
                    
                    if let results: NSArray = jsonResult["tipo_cat"] as? NSArray {
                       self.delegate?.didReceiveAPIResults(results)
                    }
                }
            })
            
            // The task is just an object with all these properties set
            // In order to actually make the web request, we need to "resume"
            task.resume()
        }
    }

}

